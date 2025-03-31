contract Playground {
    receive("plays") {
        dumpStack();
    }
}
