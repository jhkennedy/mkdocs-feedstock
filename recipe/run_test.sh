#!/bin/sh

# create minimal mkdocs project
mkdir -p /tmp/test_mkdocs_build/docs
cat <<'EOT' > /tmp/test_mkdocs_build/docs/index.md
# Just a Test
just a test..
EOT
cat <<'EOT' > /tmp/test_mkdocs_build/mkdocs.yml
site_name: mkdocs
pages:
- 'Home': 'index.md'
EOT

# build it..
cd /tmp/test_mkdocs_build/
mkdocs build

# on correct execution some files should have been created and we can check the
# headline we created..
grep '<h1 id="just-a-test">Just a Test</h1>' site/index.html
