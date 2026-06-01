# Stable smoke test — assert on the contract (exit code, version shape,
# computed result), never on help/version prose. fish reworks its banner
# and help text freely; the version digits and `math` arithmetic are the
# contract. (Linux-only mirror, but branch on the typed platform constant
# anyway so the script is portable if darwin/windows are added later.)
FISH = "fish.exe" if ocx.target_platform.os == ocx.os.Windows else "fish"

# Tier 1 + 2: liveness + version SHAPE.
# `fish --version` prints e.g. "fish, version 4.7.1" — match the digits only.
r_version = ocx.run(FISH, "--version")
expect.ok(r_version)
expect.matches(r_version.stdout, r"\d+\.\d+\.\d+")

# Tier 3: functional behavior — fish's built-in `math` evaluates an
# expression and prints the result. Assert the computed value, not prose.
r_math = ocx.run(FISH, "-c", "math 1 + 1")
expect.ok(r_math)
expect.contains(r_math.stdout, "2")

# Tier 3 (b): the `$version` shell variable is part of fish's documented
# contract and reports the running version — assert its shape, not the
# exact value.
r_var = ocx.run(FISH, "-c", "echo $version")
expect.ok(r_var)
expect.matches(r_var.stdout, r"\d+\.\d+\.\d+")
