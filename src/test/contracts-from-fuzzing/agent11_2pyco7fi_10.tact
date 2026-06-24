contract TestDumpBool {
    receive() {
        dump(true);
        dump(false);
    }
}
