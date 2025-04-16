contract TestUnicodeString {
    receive() {
        let unicode = "Hello, \u{1F680}"; // rocket emoji 🚀
    }
}