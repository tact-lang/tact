contract TestAddressMap {
    fun test() : Bool {
        // Create an empty map with Address keys and Int values using let binding
        let m: map<Address, Int> = emptyMap();
        
        // Create two addresses with the same hash but different chain ids
        let a1: Address = newAddress(0, 0x1234);
        let a2: Address = newAddress(-1, 0x1234);
        
        // Use the map to store distinct values for these addresses
        m.set(a1, 1);
        m.set(a2, 2);
        
        // Check that the values can be individually retrieved, confirming that the addresses differ
        return (m.get(a1) == 1) && (m.get(a2) == 2);
    }
}

contract TestInvalidToAddress {
    fun test() : Bool {
        // Test conversion of a slice that does not contain a valid address.
        // asAddressUnsafe is an unchecked conversion, and behavior on empty slice is undefined.
        let s: Slice = beginCell().asSlice();
        let a: Address = s.asAddressUnsafe();
        // As a convention, we may expect newAddress(0, 0) for an empty cell, but this behavior is not documented.
        return a == newAddress(0, 0);
    }
}
