fun test_invalidAddress_fromSlice() {
    // Based on docs: a valid standard address occupies 267 bits, with a 3-bit prefix of 0b100.
    // We'll create an invalid address by using an incorrect 3-bit prefix.
    let basechainID = 0;
    let cell: Cell = beginCell()
        .storeUint(0b010, 3)  // Incorrect prefix: should be 0b100
        .storeInt(basechainID, 8) // Chain ID (0 for basechain)
        .storeUint(0, 256) // Incorrect account id size: using 256 bits is valid but prefix is wrong
        .endCell();
    let s: Slice = cell.beginParse();
    try {
        // asAddress expects a valid standard address, this should throw exit code 136
        dump(s.asAddress(basechainID));
    } catch (exitCode) {
        dump(exitCode);
    }
}

fun main() {
    test_invalidAddress_fromSlice();
}
