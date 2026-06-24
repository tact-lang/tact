fun testParseStdAddress() {
    let addr: Address = address("EQDtFpEwcFAEcRe5mLVh2N6C0x-_hJEM7W61_JLnSF74p4q2");
    let parsed = parseStdAddress(addr.asSlice());
    let addr2: Address = newAddress(parsed.workchain, parsed.address);
    require(addr == addr2, "Parsed standard address mismatch");
}

fun main() {
    testParseStdAddress();
}
