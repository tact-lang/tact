contract TestHashDataLong {
    receive() {
        // Test hashData on a string longer than 127 bytes.
        // According to docs, only the first 127 bytes are hashed, potentially causing collisions if they are identical.
        // This test does not expect an error but uses a long string to validate that behavior.
        let longStr: String = "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA";
        let h: Int = longStr.hashData();
        h;
    }
}
