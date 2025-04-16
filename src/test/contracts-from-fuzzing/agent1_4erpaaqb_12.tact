fun testParseVarAddress() {
    // Construct a cell for a variable-length address as per documentation
    // Structure: first 3 bits: indicator (6), next 9 bits: bit-length (123), then 32 bits for workchain, then 123 bits for address value
    let varAddrSlice = beginCell()
        .storeUint(6, 3)
        .storeUint(123, 9)
        .storeUint(234, 32)
        .storeUint(345, 123)
        .asSlice();
    let parsedVar = parseVarAddress(varAddrSlice);
    require(parsedVar.workchain == 234, "VarAddress workchain mismatch");
    let recovered = parsedVar.address.loadUint(123);
    require(recovered == 345, "VarAddress inner value mismatch");
}

fun main() {
    testParseVarAddress();
}
