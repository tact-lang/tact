contract Test {
    receive() {
        // Dump the result of an emit call (which is void)
        dump(emit("Debug message".asComment()));
    }
}
