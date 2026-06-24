contract TestSHA256() {
    fun run() {
         // Compute sha256 hash of a literal at compile-time
         dump(sha256("hello"));
    }

    receive() {
         self.run();
    }
}
