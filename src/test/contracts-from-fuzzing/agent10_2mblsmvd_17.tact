contract DebugAddress {
    receive() {
        dump(myAddress());
    }
}
