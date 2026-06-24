contract TestReceive {
    receive() {
        // Early return inside receiver
        if (now() % 2 == 0) {
            return;
        }

        // Instead of returning a value (receivers don't return values), just execute logic
        dump("Received message");
    }
}
