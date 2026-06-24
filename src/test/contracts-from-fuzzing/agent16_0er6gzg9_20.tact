contract Test {
    receive() {
        // Testing map with serialization conversion for both keys and values
        // Allowed since allowed key/value type is Int and can specify a fixed width serialization
        let m: map<Int as uint8, Int as uint8> = emptyMap();
        
        // Inserting a key-value pair (both serialized as 8-bit uint)
        // Note: 42 and 99 must fit within 8 bits, which they do
        m.set(42, 99);
        
        // Retrieve the value
        let v: Int? = m.get(42);
        dump(v!!); // Expected to dump 99
    }
}
