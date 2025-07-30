contract TestSerializedMapKey {
    receive() {
        // Test map with a serialized key: Int as uint8 (range 0..255)
        let m: map<Int as uint8, Int> = emptyMap();
        
        // Set a value with a valid key (255 is within uint8 range)
        m.set(255, 42);
        let v1: Int? = m.get(255);
        
        // Attempt to set a value with a key outside the range of uint8
        // Note: The compiler should allow the literal 256 type Int, but then serialize as uint8
        // We expect a conversion or runtime error if the conversion is implicit, depending on Tact spec
        m.set(256, 99);
        let v2: Int? = m.get(256);
    }
}
