contract TestDumpAddress {
    receive() {
        dump(myAddress());
    }
}
