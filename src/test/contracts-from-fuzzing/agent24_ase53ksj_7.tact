contract TestSliceToAddress {
    fun test() : Bool {
        let a: Address = address("UQDpXLZKrkHsOuE_C1aS69C697wE568vTnqSeRfBXZfvmVOo");
        let cell = beginCell().storeAddress(a);
        let slice: Slice = cell.asSlice();
        let a2: Address = slice.asAddressUnsafe();
        return a == a2;
    }
}
