contract TestStringFromBase64 {
    receive() {
        // Test String.fromBase64 extension function
        let s: String = "SGVyZSdzIEpvaG5ueSE="; // Base64 for "Here's Jony!"
        let sl: Slice = s.fromBase64();
    }
}
