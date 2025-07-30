contract TestNegativeBasechain {
    // Test 18: Using newBasechainAddress with a negative hash value
    // Although a hash is expected to be a non-negative value, Int in Tact may accept negative values.
    // This test checks if the compiler accepts it and how the resulting BasechainAddress is treated.
    fun testNegativeHash() {
         let base: BasechainAddress = newBasechainAddress(-1);
         let _ : Bool = base.hash != null; // expecting true
    }

    // Test 19: Using asAddressUnsafe on a Slice that doesn't contain a valid address
    // This might lead to a runtime error but should compile successfully.
    // We create an empty Cell and try to load an address from it.
    fun testInvalidSliceConversion() {
         let cell: Cell = beginCell().endCell();
         let slice: Slice = cell.beginParse();
         // Warning: This is an invalid conversion and may throw at runtime
         // However, at compile time it should be accepted
         let _ : Address = slice.asAddressUnsafe();
    }

    // Test 20: Mixing BasechainAddress with contractAddress utilities in nested expressions
    fun testNestedBasechain() {
         let s: StateInit = initOf TestNegativeBasechain();
         let addr: BasechainAddress = contractBasechainAddress(s);
         // Now convert the BasechainAddress's hash field to an Address using newAddress if not null
         // If the hash is null then use a default empty basechain address
         let actual: Address = addr.hash != null ? newAddress(0, addr.hash!!) : newAddress(0, 0);
         let _ : Slice = actual.asSlice();
    }
}
