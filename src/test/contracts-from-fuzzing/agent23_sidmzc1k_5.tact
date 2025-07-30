contract TestOptionalNullDump {
    receive() {
        dump(null);
    }
}
