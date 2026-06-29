# mirror-fish

OCX mirror for [fish](https://github.com/fish-shell/fish-shell). Publishes
GitHub releases to `ocx.sh/fish` with cascade tags after a smoke test per
`(version, platform)`.

Platforms: `linux/amd64`, `linux/arm64`, `darwin/amd64`, `darwin/arm64`.

- **linux** — upstream's `fish-<v>-linux-{x86_64,aarch64}.tar.xz` is a single
  self-contained `fish` binary; bundled bare at the root (`strip_components: 0`),
  `PATH = ${installPath}`.
- **darwin** — upstream's `fish-<v>.app.zip` carries ONE universal
  (arm64 + x86_64) binary. The same asset serves both darwin arches;
  `strip_components: 6` lifts the `.app`'s `…/base/usr/local/{bin,share,etc}`
  install tree to the bundle root (dropping the GUI launcher + signature files),
  `PATH = ${installPath}/bin` via `metadata-darwin.json`. Both darwin legs run on
  Apple-Silicon runners (Intel runners are retired); fish is launched as bare
  `fish` on every platform.

No Windows: upstream ships no Windows binary.

## Editing

| File | Edit | Regenerate after |
|------|------|------------------|
| `mirror.yml` | hand | `ocx-mirror pipeline generate ci` |
| `tests/smoke.star` | hand | — |
| `metadata*.json`, `CATALOG.md`, `logo.*` | hand | — |
| `.github/workflows/*.yml` | generated | re-run when `mirror.yml` changes |

CI fails on drift via `ocx-mirror pipeline generate ci --check`.

## Required secrets

| Secret | Use |
|--------|-----|
| `OCX_MIRROR_REGISTRY_TOKEN` + `OCX_MIRROR_REGISTRY_USER` | `ocx package push` to `ocx.sh` |
| `OCX_MIRROR_DISCORD_HOOK` | notify-stage Discord webhook URL |

(Inherited from the `ocx-contrib` org with visibility ALL.)

## License

Apache-2.0 — see [`LICENSE`](LICENSE). Upstream assets are out of
scope; see [`NOTICE.md`](NOTICE.md).
