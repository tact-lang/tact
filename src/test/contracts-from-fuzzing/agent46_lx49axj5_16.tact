contract TestLongStringHash {
    receive() {
        // Construct a 128-character long string (ASCII characters 'A')
        // 128 'A's exactly
        let s: String = "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA";
        // According to documentation, hashData hashes only the first 127 bytes. With a 128-byte string, this may cause collisions, but that's intended behavior.
        let h: Int = s.hashData();
        h;
    }
}
