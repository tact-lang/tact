contract TestOptionalSuccess() {
    fun run() {
         let b: Int? = 10;
         let c: Int = b!!; // Valid: b is optional and non-null here
         dump(c); // expected to dump 10
    }
    receive() { self.run(); }
}
