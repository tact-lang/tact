contract ConstEvalSHA256Test {
    // Test compile-time evaluation of the sha256 function.
    // We define a constant using sha256 on a constant string.
    // We expect the hash to be non-zero. (For a given input, it should be fixed.)
    const SHA: Int = sha256("hello world");

    fun test() {
         // Ensure the computed hash is non-zero. This is a basic sanity check.
         require(self.SHA != 0, "sha256 constant evaluation returned 0");
    }

    receive() {
         self.test();
         cashback(sender());
    }
}
