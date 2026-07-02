# NOTICE

This repository packages and redistributes upstream [fish](https://github.com/fish-shell/fish-shell).

The Apache-2.0 license covers the OCX pipeline files authored here. It does
**not** cover upstream-derived assets — the fish binaries published to
`ocx.sh/fish` (GPL-2.0, Axel Liljencrantz and the fish-shell contributors) and
the fish logo (the friendly-fish terminal mark, a trademark of the fish-shell
project and its contributors, used for catalog identification under nominative
fair use).

## Corresponding Source (GPL-2.0)

The fish binaries redistributed here are licensed GPL-2.0. The complete
Corresponding Source (including build scripts) for every mirrored version is the
upstream tagged tree:

- Version `X.Y.Z` → tag `X.Y.Z` →
  <https://github.com/fish-shell/fish-shell/releases/tag/X.Y.Z>
- Or clone and check out the exact tag:

  ```bash
  git clone https://github.com/fish-shell/fish-shell
  git -C fish-shell checkout X.Y.Z   # X.Y.Z = the ocx.sh/fish version
  ```

GPL-2.0 has no "same place" network-access clause, so as required by GPLv2
§3(b) the maintainers of this mirror additionally offer, valid for three years
from the distribution of any given version, to provide the complete
Corresponding Source for that version to any third party on request — open an
issue at <https://github.com/ocx-contrib/mirror-fish>. No additional
restrictions are imposed beyond GPL-2.0.
