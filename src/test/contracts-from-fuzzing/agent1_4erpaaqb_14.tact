fun testMultipleAddresses() {
    let addr1: Address = newAddress(0, 0xAAA);
    let addr2: Address = newAddress(-1, 0xBBB);
    let cell: Cell = beginCell()
        .storeAddress(addr1)
        .storeAddress(addr2)
        .endCell();
    let s: Slice = cell.asSlice();
    let loaded1: Address = s.loadAddress();
    let loaded2: Address = s.loadAddress();
    require(loaded1 == addr1, "First address mismatch");
    require(loaded2 == addr2, "Second address mismatch");
}

fun testEmptySlice() {
    let s: Slice = beginCell().endCell().asSlice();
    try {
        s.loadAddress();
    } catch (exitCode) {
        require(exitCode == 8, "Expected exit code 8 for loadAddress on empty slice");
    }
}

fun testIncompleteVarAddress() {
    // Create a var address slice with declared bit-length 100, but supply only workchain id
    let cellPart: Cell = beginCell()
        .storeUint(6, 3)       // indicator for VarAddress
        .storeUint(100, 9)      // declared bit-length of the address payload
        .storeUint(123, 32)     // workchain id provided
        // Missing the actual address bits which should be 100 bits in total
        .endCell();
    let varAddrSlice: Slice = cellPart.asSlice();
    try {
        parseVarAddress(varAddrSlice);
    } catch (exitCode) {
        require(exitCode == 9, "Expected exit code 9 for incomplete var address slice");
    }
}

fun testAddressStringRoundtrip() {
    let orig: Address = newAddress(0, 0xDEADBEEF);
    let s: String = orig.toString();
    let conv: Address = address(s);
    require(orig == conv, "Address string roundtrip failed");
}

fun main() {
    testMultipleAddresses();
    testEmptySlice();
    testIncompleteVarAddress();
    testAddressStringRoundtrip();
}
