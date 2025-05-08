contract Test {
    receive() {
        dump(emit("test".asComment()));
    }
}
