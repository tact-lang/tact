contract Test {
    // Test: Fixed text receiver with comment exactly 123 bytes long
    // 12 groups of 10 'a' characters (120) plus 3 additional 'a' characters
    receive("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa") {
        // receiver for fixed text comment of 123 bytes
    }
}
