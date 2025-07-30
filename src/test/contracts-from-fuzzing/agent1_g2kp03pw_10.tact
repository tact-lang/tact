contract Test {
    receive() {
        dump(emit("msg".asComment()));
    }
}
