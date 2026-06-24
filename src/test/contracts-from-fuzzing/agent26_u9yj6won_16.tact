contract TestMyAddress {
    receive() {
        let addr1 = myAddress();
        let addr2 = contractAddress(initOf TestMyAddress());
        // They are expected to be equal, per documentation
        dump(addr1 == addr2);
    }
}

fun integratedAddressTest() {
    // Run individual tests sequentially
    testParseVarAddressUnderflow();
    testStoreVarUint32OutOfRange();
    testStoreVarInt32OutOfRange();
    dump("Integrated test complete");
}

fun testParseVarAddressUnderflow() {
    // Create a slice with partial data for a VarAddress: tag and length provided, but missing workchain and address bits
    let slice = beginCell()
        .storeUint(6, 3)    // Tag for VarAddress
        .storeUint(123, 9)  // Bit-length indicator
        .asSlice();
    try {
        let _ = parseVarAddress(slice);
    } catch (exitCode) {
        dump(exitCode);
    }
}

fun testStoreVarUint32OutOfRange() {
    let b = beginCell();
    // 1 << 250 exceeds the allowed range for storeVarUint32
    try {
        let _ = b.storeVarUint32(1 << 250);
    } catch (exitCode) {
        dump(exitCode);
    }
}

fun testStoreVarInt32OutOfRange() {
    let b = beginCell();
    // 1 << 250 exceeds the range for storeVarInt32 as well
    try {
        let _ = b.storeVarInt32(1 << 250);
    } catch (exitCode) {
        dump(exitCode);
    }
}
