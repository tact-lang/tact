fun testCellOverflow() {
    try {
        // Create a cell builder and intentionally store more bits than allowed (1023 bits)
        // Here we try to store 1024 bits using storeUint(0, 1024)
        let cell = beginCell()
                       .storeUint(0, 1024)
                       .endCell();
        dump(cell);
    } catch (exitCode) {
        // Dump the exit code; according to documentation, this should be exit code 8 (Cell overflow)
        dump(exitCode);
    }
}

fun runTest() {
    testCellOverflow();
}
