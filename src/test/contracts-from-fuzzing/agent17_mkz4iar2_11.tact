contract Test {
    receive() {
        dump(emit("Hello".asComment()));
    }
}
