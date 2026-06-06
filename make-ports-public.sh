#!/usr/bin/env bash
# Make the gateway + Presidio ports public in one shot.
# GitHub Codespaces does not persist port visibility across restarts, so run this
# after each restart (or rely on the best-effort postStartCommand in devcontainer.json).
#
# Usage:  bash make-ports-public.sh
set -uo pipefail

PORTS="8000 8001 5001 5002"
ARGS=""
for p in $PORTS; do ARGS="$ARGS ${p}:public"; done

echo "Setting ports public: $PORTS"
gh codespace ports visibility $ARGS -c "$CODESPACE_NAME" \
  && echo "Done — 8000/8001/5001/5002 are public." \
  || echo "Could not set visibility automatically (token scope/timing). Set them manually in the Ports panel, or run this again once the services are up."
