contract TestDumpEmit {
    receive() {
        dump(emit("test".asComment()));
    }
}
