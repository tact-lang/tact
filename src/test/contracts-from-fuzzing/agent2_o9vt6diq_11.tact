contract TestExtraAddressEdgeCases {
    // This contract performs additional tests on address related functionalities to push the compiler.
    receive() {
        // 1. Test myAddress roundtrip through toString() and asSlice() multiple times
        let a = myAddress();
        let s = a.asSlice();
        let stdAddr = parseStdAddress(s);
        let a_round = newAddress(stdAddr.workchain, stdAddr.address);
        require(a == a_round, "EdgeRoundtrip");

        // 2. Test conversion for a constant address literal using toString() and compare with another conversion
        let litAddr = address("EQDtFpEwcFAEcRe5mLVh2N6C0x-_hJEM7W61_JLnSF74p4q2");
        let litStr = litAddr.toString();
        // The toString() of a constant address should match its literal form as documented
        require(litStr == "EQDtFpEwcFAEcRe5mLVh2N6C0x-_hJEM7W61_JLnSF74p4q2", "EdgeLiteral");

        // 3. Test storing an address into a cell as part of a larger structure
        let builder = beginCell()
            .storeAddress(a)
            .storeUint(999, 16);
        let slice2 = builder.asSlice();
        let a_loaded = slice2.loadAddress();
        let num = slice2.loadUint(16);
        require(a == a_loaded, "EdgeStoreLoad");
        require(num == 999, "EdgeStoreLoadNum");

        // 4. Test conversion of a maximum and minimum allowed hash
        let minHash = 0x0; // minimum hash
        let addrMin = newAddress(0, minHash);
        let s_min = addrMin.asSlice();
        let stdMin = parseStdAddress(s_min);
        let addrMin2 = newAddress(stdMin.workchain, stdMin.address);
        require(addrMin == addrMin2, "EdgeMinHash");

        let maxHash = 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff; // max 256-bit
        let addrMax = newAddress(0, maxHash);
        let s_max = addrMax.asSlice();
        let stdMax = parseStdAddress(s_max);
        let addrMax2 = newAddress(stdMax.workchain, stdMax.address);
        require(addrMax == addrMax2, "EdgeMaxHash");
    }
}
