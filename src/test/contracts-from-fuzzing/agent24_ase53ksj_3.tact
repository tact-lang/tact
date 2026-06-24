contract TestAddresses {
    // Test that emptyBasechainAddress returns an address with null hash
    fun testEmptyBasechain() : Bool {
        let base: BasechainAddress = emptyBasechainAddress();
        return base.hash == null;
    }

    // Test that newBasechainAddress stores provided hash
    fun testNewBasechain() : Bool {
        let base: BasechainAddress = newBasechainAddress(123456);
        return base.hash == 123456;
    }

    // Test that toString returns the same string representation
    fun testAddressToString() : Bool {
        let a: Address = address("UQDpXLZKrkHsOuE_C1aS69C697wE568vTnqSeRfBXZfvmVOo");
        return a.toString() == "UQDpXLZKrkHsOuE_C1aS69C697wE568vTnqSeRfBXZfvmVOo";
    }

    // Test that asSlice conversion is equivalent to storing address in a cell and converting
    fun testAddressSlice() : Bool {
        let a: Address = address("UQDpXLZKrkHsOuE_C1aS69C697wE568vTnqSeRfBXZfvmVOo");
        let slice1: Slice = a.asSlice();
        let slice2: Slice = beginCell().storeAddress(a).asSlice();
        return slice1 == slice2;
    }
}
