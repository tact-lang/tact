contract TestDumpStack {
    receive() {
        dumpStack();
        dump(1);
    }
}
