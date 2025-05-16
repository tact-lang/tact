contract TestSerialization {
    receive() {
        // Test 8: Serialization of map keys and values
        // Using serialized types: Int as uint8 for keys and values
        let m: map<Int as uint8, Int as uint8> = emptyMap();
        m.set(10, 20);
        let res: Int? = m.get(10);
        // Expected: res == 20
    }
}
