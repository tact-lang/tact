fun testEndsWithBackslash(): String {
    // This string literal ends with a valid escaped backslash
    return "ends with backslash: \\";
}

contract TestContract {
    receive() {
        let s = testEndsWithBackslash();
    }
}
