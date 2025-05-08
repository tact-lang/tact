contract TestSha2() {
    // Define a contract-level constant computed at compile time using sha256
    // Expected behavior: it should compute the compile-time sha256 hash of "hello" as an integer.
    const testSha: Int = sha256("hello");

    // Getter returns self.testSha which references the constant
    get fun getSha(): Int {
        return self.testSha;
    }
}
