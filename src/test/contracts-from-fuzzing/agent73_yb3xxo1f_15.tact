contract Test {
    receive() {
        // Testing try-catch with invalid base64 string
        // According to documentation, if fromBase64 is called with an invalid base64 string,
        // an exception with exit code 134 should be thrown.
        try {
            let s: String = "not_base64";
            s.fromBase64();
            // If no exception thrown, then that's unexpected
            throw(1);
        } catch (err) {
            // Check if the caught error is exit code 134, as expected
            if (err != 134) {
                throw(2);
            }
        }
    }
}
