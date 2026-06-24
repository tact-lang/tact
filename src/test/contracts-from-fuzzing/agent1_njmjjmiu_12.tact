contract MapSerializationTest {
    receive() {
        // Test map with serialized key and value types
        let m: map<Int as uint8, Int as uint8> = emptyMap();
        m.set(255, 200);
        dump(m.get(255)!!); // Expected output: 200
    }
}
