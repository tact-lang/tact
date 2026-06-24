contract TestDumpCell {
    receive() {
        dump(emptyCell());
    }
}
