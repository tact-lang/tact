contract TestTrailingBackslash {
    receive() {
        // This should fail due to an unterminated escape sequence (a trailing backslash)
        "Trailing backslash: \\";
    }
}
