contract Test {
    receive() {
        // Test collision behavior of hashData() on long strings
        // Build s1: a string of 127 'A's followed by 'B'
        let sb1: StringBuilder = beginString();
        sb1.append("AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA");
        sb1.append("B");
        let s1: String = sb1.toString();

        // Build s2: a string of 127 'A's followed by 'C'
        let sb2: StringBuilder = beginString();
        sb2.append("AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA");
        sb2.append("C");
        let s2: String = sb2.toString();

        // According to documentation, hashData() only hashes the first 127 bytes.
        // Thus, s1 and s2 should produce the same hash even though they differ after the 127th byte.
        if (s1.hashData() != s2.hashData()) {
            // This branch should not be taken; if it is, it indicates a bug in hashData handling
            let dummy: Int = s1.hashData() + s2.hashData();
        }
    }
}
