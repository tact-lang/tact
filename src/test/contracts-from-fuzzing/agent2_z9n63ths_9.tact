contract CompileTimeExprTest {
    fun test() {
        // Testing compile-time-only functions and global functions in expressions
        let a: Int = ascii("⚡");
        dump(a); // Expected to output 14850721 or similar

        let b: Cell = cell("te6cckEBAQEAAgAAAEysuc0=");
        dump(b); // Expected to output a representation of an empty Cell

        let c: Slice = slice("te6cckEBAQEADgAAGEhlbGxvIHdvcmxkIXgtxbw=");
        dump(c); // Expected to output a Slice representing "Hello world!"

        let d: Slice = rawSlice("000DEADBEEF000");
        dump(d); // Expected to output a Slice representation of the raw bits

        let e: Int = ton("1");
        dump(e); // Expected to output 1000000000 (i.e., 10^9)

        dump(now()); // Dump current UNIX timestamp in seconds
    }

    receive() {
        self.test();
    }
}
