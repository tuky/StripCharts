# StripCharts
Strip down the awesome but slow to update TrueCharts catalog to what really matters to you

This is a simple dockerized cron script that grabs just the specifed apps from the TrueCharts catalog and pushes them into your own github catalog. You have to provide these environment variables:

* `STRIP_STABLE` to specify the *stable* apps to grab, e.g. `nextcloud|plex|traefik|cloudflareddns|vaultwarden` (it's important to separate via pipe `|` because that is directly used inside a grep regex)
* `STRIP_INCUBATOR` to specify the *incubator* apps to grab, e.g. `actualserver|breitbandmessung-de`
* `STRIP_REPO` to specify your git repo URL where to push the stripped down catalog. I recommend github because you can host a repo for free and you can include the auth token to authorize the push, e.g. `https://ghp_17613457614573562476235476@github.com/tuky/my-stripped-charts.git`

The script will always amend and force push on the last commit (or create a new commit, if repo still empty) to prevent the repo from getting larger in file size.

Also see the [wiki](https://github.com/tuky/StripCharts/wiki) for an example configuration with further explanations and screenshots.

Contributions welcome! thx
