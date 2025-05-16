contract TestDumpSlice {
    receive() {
        dump(beginCell().asSlice());
    }
}
