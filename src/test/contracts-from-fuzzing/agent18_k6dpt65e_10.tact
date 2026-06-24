contract Test {
    receive() {
        // Testing dump with a nonsensical input: the result of emit(), which returns void
        dump(emit("msg".asComment()));
    }
}
