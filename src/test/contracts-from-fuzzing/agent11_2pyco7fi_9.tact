contract TestDumpVoid {
    // Test dump() on a void (i.e. function with no return) value via emit(...)
    receive() {
        dump(emit("Test".asComment()));
    }
}
