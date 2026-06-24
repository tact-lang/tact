contract TestRawSlice {
    fun test() {
        // Testing the rawSlice function, which takes a hex string representing a cell slice
        // and returns a Slice. The output cell's contents are not directly human-readable with dump,
        // but we can at least force evaluation of this expression.
        let s: Slice = rawSlice("000DEADBEEF000");
        dump(s);
    }

    receive() {
        self.test();
    }
}
