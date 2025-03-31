contract Test2 {
    receive() {
        // Testing error for value out of range in serialized keys
        // In a map with keys of type Int serialized as uint8, the allowed literal values must be in [0, 255]
        let m: map<Int as uint8, Int as uint8> = emptyMap();
        // Setting a key that doesn't fit into 8 bits (256 is out of range)
        m.set(256, 10);
        // This should result in a compile-time error
        dump(m.get(256)!!);
    }
}
