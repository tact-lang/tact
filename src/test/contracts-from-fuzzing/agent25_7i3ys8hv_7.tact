contract TestDumpEmit {
    receive() {
        dump(emit("msg".asComment())); // dump on the result of emit(), which should be void
    }
}
