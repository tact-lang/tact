contract Test {
    receive() {
        // Dumping the result of emit(), which returns void
        dump(emit("test".asComment()));
    }
}
