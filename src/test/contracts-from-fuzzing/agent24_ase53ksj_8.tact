contract TestInvalidAddressSlice {
    // This function tests that Slice.asAddress() properly detects an invalid address slice.
    // We intentionally store an incorrect tag prefix in the cell, so safe conversion should throw exit code 136.
    fun test() : Bool {
        let chain: Int = 0;
        // Build a cell with an invalid tag prefix (expected: 0b100, we use 0b010 instead)
        let cell = beginCell()
            .storeUint(0b010, 3)      // incorrect tag prefix (should be 0b100 for a standard address)
            .storeInt(chain, 8)       // chain id
            .storeUint(0, 256)        // account id with valid length
            .endCell();
        let slice = cell.asSlice();
        try {
            let _ : Address = slice.asAddress(chain);
            // If conversion did not throw, that's a bug.
            return false;
        } catch (exitCode) {
            // Expect exit code 136: Invalid standard address
            return exitCode == 136;
        }
    }
}
