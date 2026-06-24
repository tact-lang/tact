contract OverflowTest {
    receive() {
        // Try to store an integer with 1024 bits, which exceeds Cell's capacity (1023 bits)
        try {
            let c: Cell = beginCell()
                .storeInt(0, 1024)  // Attempt to store 1024 bits, should trigger overflow
                .endCell();
            dump(0); // if no error, dump 0
        } catch (exitCode) {
            // Expecting exit code 8: "Cell overflow"
            dump(exitCode);
        }
        cashback(sender());
    }
}
