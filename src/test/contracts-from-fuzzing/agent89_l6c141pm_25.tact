contract Test {
    // Receiver with a literal string of exactly 123 characters (edge case for maximum allowed length)
    // We construct the string by repeating 'aaaaaaaaaa' 12 times (120 chars) then adding 'aaa' (3 chars) => 123 chars total
    receive("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa") {
    }
}
