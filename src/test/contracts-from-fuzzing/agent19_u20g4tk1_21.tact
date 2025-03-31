contract TestTailString {
    receive() {
        // Test beginTailString functionality: it should prefix the resulting String with a single null byte
        let sb: StringBuilder = beginTailString();
        sb.append("tail");
        let s: String = sb.toString();
        // Convert to slice and load the first 8 bits; tail string should be prefixed with one 0 byte
        let prefix: Int = s.asSlice().loadUint(8);
        require(prefix == 0, "tail prefix error");
    }
}
