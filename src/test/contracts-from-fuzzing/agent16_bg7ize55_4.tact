contract TestBool {
    // Test: dump with Bool values
    receive() {
        dump(true);
        dump(false);
    }
}
