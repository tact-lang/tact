contract DebugIfDump {
    receive() {
        if (1 + 1 == 2) {
            dump(42);
        } else {
            dump(0);
        }
    }
}
