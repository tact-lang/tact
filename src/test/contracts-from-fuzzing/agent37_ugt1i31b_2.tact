fun testInvalidChain() {
    // According to the docs, newAddress should only accept chain IDs 0 and -1 (workchain and masterchain)
    // This is a compile-time check. Using 1 should trigger a compile error.
    let addr: Address = newAddress(1, 0x0);
}
