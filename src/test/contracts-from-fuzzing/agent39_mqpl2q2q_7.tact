contract TestSHA256 {
    // Constant computed using sha256 (compile-time built-in function)
    const test_sha: Int = sha256("hello");

    // Getter to retrieve the computed hash
    get fun getSHA() : Int {
        return self.test_sha;
    }
}
