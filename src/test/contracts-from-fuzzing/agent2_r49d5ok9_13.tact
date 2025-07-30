contract TestDoubleDump {
    // Test dump() on the result of dump(1), which returns void
    receive() {
        dump(dump(1));
    }
}
