fun testUnicodeCurly() : String {
    // Testing unicode escape using \u{...} syntax, should return a laughing emoji
    return "\u{1F602}";
}

contract TestContractUnicodeCurly {
    receive() {
        testUnicodeCurly();
    }
}
