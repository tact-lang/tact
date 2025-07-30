fun testAddressRoundtrip() : Bool {
    let a: Address = address("UQDpXLZKrkHsOuE_C1aS69C697wE568vTnqSeRfBXZfvmVOo");
    let s: Slice = a.asSlice();
    let a2: Address = s.asAddressUnsafe();
    return a.toString() == a2.toString();
}
