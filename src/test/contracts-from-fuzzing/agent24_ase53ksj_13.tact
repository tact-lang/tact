contract TestIncompleteStdAddressParsing {
    // This contract tests that parseStdAddress throws an exception with exit code 9 (Cell underflow) when provided with an incomplete cell.
    fun test() : Bool {
        // A standard address requires 3 (tag) + 8 (chain id) + 256 (account id) = 267 bits. We intentionally store only 20 bits.
        let cell = beginCell().storeUint(1, 20).endCell();
        let s: Slice = cell.asSlice();
        try {
            let _ = parseStdAddress(s);
            return false; // If no error, then it is a bug
        } catch (exitCode) {
            return exitCode == 9;
        }
    }
}

contract TestIncompleteVarAddressParsing {
    // This contract tests that parseVarAddress throws an exception with exit code 9 (Cell underflow) when provided with an incomplete cell.
    fun test() : Bool {
        // A VarAddress is constructed as follows:
        // - 3 bits: indicator for VarAddress (should be 6)
        // - 9 bits: the bit length (l) of the address
        // - 32 bits: workchain ID
        // - l bits: the address value
        // Here, we intentionally omit the workchain and address value by storing only the indicator and bit length.
        let cell = beginCell()
                        .storeUint(6, 3)   // indicator for VarAddress
                        .storeUint(123, 9)   // bit length
                        .endCell();
        let s: Slice = cell.asSlice();
        try {
            let _ = parseVarAddress(s);
            return false; // If parsing succeeds, it's a bug
        } catch (exitCode) {
            return exitCode == 9;
        }
    }
}
