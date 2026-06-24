struct Nested {
    inner: map<Int, Int>;
}

contract TestNested {
    receive() {
        // Test nested map structures in structs
        let m: map<Address, Nested> = emptyMap();
        // Create an example Address with valid hex encoding (64 hex digits after 0:)
        let addr: Address = address("0:0123456789abcdef0123456789abcdef0123456789abcdef0123456789abcdef");
        // Create a Nested struct with an inner map, and set some values in inner map
        let nested: Nested = Nested { inner: emptyMap() };
        nested.inner.set(1, 10);
        nested.inner.set(2, 20);
        m.set(addr, nested);
        
        // Retrieve the nested struct
        let retrieved: Nested? = m.get(addr);
        let val1: Int? = retrieved != null ? retrieved!!.inner.get(1) : null;
        let val2: Int? = retrieved != null ? retrieved!!.inner.get(2) : null;
        // Expected: val1 == 10 and val2 == 20
    }
}
