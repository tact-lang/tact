contract Test {
    receive() {
        // Test: Using beginTailString() to create a tail string (which prefixes the string with a null byte)
        // and then converting it to a String.
        // This tests that the null prefix is correctly handled, as documented.
        let sb: StringBuilder = beginTailString();
        sb.append("Testing TailString");
        let s: String = sb.toString();
        dump(s);
    }
}
