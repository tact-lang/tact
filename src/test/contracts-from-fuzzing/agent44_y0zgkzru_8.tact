contract TestSha256 {
    // Test constant evaluation of built-in compile-time function sha256()
    // Expected: The sha256 of "hello" should be computed at compile-time as an Int.
    const SHA: Int = sha256("hello");

    fun getSha(): Int {
         return self.SHA;
    }

    receive() {
         dump(self.getSha());
    }
}
