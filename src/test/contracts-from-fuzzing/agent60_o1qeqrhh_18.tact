contract TestStringLiterals {
    receive() {
        // Test various string literals including escape sequences
        dump("Hello, world!");
        dump("Quote: \"This is quoted\"");
        dump("Line1\nLine2");
        dump("Tab\tSeparated");
    }
}
