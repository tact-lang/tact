contract TestCellDumpCorrected {
    receive() {
        dump(emptyCell());
    }
}
