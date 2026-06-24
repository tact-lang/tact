contract TestSliceDump {
    receive() {
        dump(emptySlice());
    }
}
