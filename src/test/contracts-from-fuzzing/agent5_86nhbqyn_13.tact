contract FuzzAddress3 {
    // Test that parseStdAddress fails with underflow if the slice is truncated
    fun test_parseStdAddress_underflow() : Bool {
        // Create a cell that does not contain enough bits for a StdAddress (which requires 267 bits)
        let s = beginCell().storeUint(0x123, 100).endCell().asSlice();
        try {
            let _ = parseStdAddress(s);
            return false; // should not succeed
        } catch (exitCode) {
            return exitCode == 9; // expecting Cell underflow error
        }
    }

    // Test creating an address with the maximum allowed 256-bit hash (all 1's)
    fun test_newAddress_max() : Bool {
        // 256-bit maximum: 0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        let maxHash = 0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF;
        let addr = newAddress(0, maxHash);
        // Verify that converting to a slice and back recovers the same address
        let addr2 = addr.asSlice().asAddress(0);
        return addr == addr2;
    }

    // Test that storing too many addresses in a single cell causes a cell overflow error (exit code 8)
    fun test_storeAddress_overflow() : Bool {
        let addr = newAddress(0, 0xABCDEF1234567890ABCDEF1234567890ABCDEF1234567890ABCDEF1234567890);
        let b = beginCell();
        try {
            // Attempt to store 5 addresses in the same cell
            let b1 = b.storeAddress(addr);
            let b2 = b1.storeAddress(addr);
            let b3 = b2.storeAddress(addr);
            let b4 = b3.storeAddress(addr);
            let _   = b4.storeAddress(addr); // This one should overflow
            return false; // no error thrown
        } catch (exitCode) {
            return exitCode == 8; // expecting Cell overflow
        }
    }
}
