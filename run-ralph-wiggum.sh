#!/bin/bash

# Run Ralph Wiggum docker container for N iterations
# Usage: ./run-ralph-wiggum.sh <iterations>

ITERATIONS=${1:-1}
USERNAME=$(whoami)

if [[ ! "$ITERATIONS" =~ ^[0-9]+$ ]]; then
    echo "Usage: $0 <number_of_iterations>"
    exit 1
fi

echo "Starting Ralph Wiggum for $ITERATIONS iterations..."

for i in $(seq 1 $ITERATIONS); do
    echo ""
    echo "══════════════════════════════════════════════════════════════"
    echo "  Ralph Wiggum - Run $i/$ITERATIONS"
    echo "══════════════════════════════════════════════════════════════"
    echo ""

    docker run --rm \
        -v "$(pwd)":/workspace \
        -v "$(pwd)/../.claude-docker":/home/$USERNAME/.claude \
        -e http_proxy \
        vibo-claude

    EXIT_CODE=$?

    if [ $EXIT_CODE -ne 0 ]; then
        echo ""
        echo "⚠️  Run $i failed with exit code $EXIT_CODE"
        echo "Stopping."
        exit $EXIT_CODE
    fi

    echo ""
    echo "✓ Run $i completed"

    # Small pause between runs
    if [ $i -lt $ITERATIONS ]; then
        sleep 2
    fi
done

echo ""
echo "══════════════════════════════════════════════════════════════"
echo "  Ralph Wiggum completed $ITERATIONS iterations"
echo "══════════════════════════════════════════════════════════════"
