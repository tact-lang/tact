fun testParseStdAddressUnderflow() {
    let cell = beginCell();
    try {
        let s = cell.asSlice();
        // This should throw because the cell has no data for a valid address
        let _ = s.asAddress(0);
    } catch (exitCode) {
        // Expect an exit code indicating cell underflow (likely exit code 9)
        dump(exitCode);
    }
}
