contract TestAddressRoundtrip {
    fun test(): Bool {
        // Create an address using newAddress with valid workchain 0
        let a: Address = newAddress(0, 42);
        // Convert the address to a slice using asSlice
        let slice: Slice = a.asSlice();
        // Convert the slice back to an address using asAddressUnsafe (the inverse of asSlice)
        let a2: Address = slice.asAddressUnsafe();
        // Check that the roundtrip conversion retains the original address
        return a == a2;
    }
}
