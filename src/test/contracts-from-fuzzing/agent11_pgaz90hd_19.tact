contract TestSha256Runtime {
    // This contract tests the sha256 built-in function at runtime.
    // When a String message is received, sha256 is computed on the runtime string input.
    // The compile-time resolution won't occur because msg is not a constant.
    
    receive(msg: String) {
        let result: Int = sha256(msg);
        dump(result);
    }
}
