contract TestStringConversions() {
    fun test() {
        // Test conversion of a String to a Slice using asSlice()
        let s: String = "hello";
        let sl: Slice = s.asSlice();
        dump(sl.bits()); // dump number of bits in the slice; expected a positive integer

        // Test conversion of a String to a Cell using asComment()
        let c: Cell = s.asComment();
        dump(c); // dump the cell; expected to represent the string with 32 leading zero bits
    }

    receive() {
        self.test();
    }
}
