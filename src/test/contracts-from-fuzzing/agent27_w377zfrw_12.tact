fun test_unicode(): String {
    // Using Unicode escape for grinning face emoji
    return "\u{1F600}";
}

contract TestContract {
    receive() {
        test_unicode();
    }
}
