contract TestBoolDump {
    receive() {
        dump(true);
        dump(false);
    }
}
