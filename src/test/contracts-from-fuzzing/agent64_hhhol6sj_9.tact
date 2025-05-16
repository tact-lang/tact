fun testUnicode(): String {
    // Grinning face (U+1F600) and face with tears of joy (U+1F602)
    return "\u{1F600}\u{1F602}";
}

contract TestContract {
    receive() {
        let s = testUnicode();
    }
}
