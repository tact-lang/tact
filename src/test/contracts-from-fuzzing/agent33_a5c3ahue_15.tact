contract Test {
    receive() {
        // Test: using invalid Base64 string with .fromBase64()
        // According to documentation, if the string contains invalid Base64 characters, an exception
        // with exit code 134 should be thrown.
        // This code intentionally attempts this.
        let s: String = "!!!notbase64!!!";
        let _ : Slice = s.fromBase64();
        // If execution continues (unexpectedly), build a message via a StringBuilder and dump it
        let msg: String = beginString()
                         .concat("Unexpected success: ")
                         .concat(s)
                         .toString();
        dump(msg);
    }
    
    fun dump(msg: String) {
        // no-op
    }
}
