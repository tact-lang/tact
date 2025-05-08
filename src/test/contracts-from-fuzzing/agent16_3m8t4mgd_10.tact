contract TestCTExpressions() {
    fun test() {
        // Testing compile-time only functions as expressions
        dump(sha256("compile-time test"));

        // Converting string to Address then to String
        dump(address("EQDtFpEwcFAEcRe5mLVh2N6C0x-_hJEM7W61_JLnSF74p4q2").toString());

        // cell() parses a Base64-encoded string into a Cell; dump the cell directly
        dump(cell("te6cckEBAQEAAgAAAEysuc0="));

        // Instead of using a non-existent bitLength() method on Slice,
        // we use the documented depth() method which returns an Int.
        dump(slice("te6cckEBAQEADgAAGEhlbGxvIHdvcmxkIXgtxbw=").depth());

        // For rawSlice, also use depth() as a substitute
        dump(rawSlice("000DEADBEEF000").depth());

        // ascii() converts a Unicode character into its integer Unicode code point
        dump(ascii("⚡"));

        // crc32() computes a 32-bit checksum for the given string
        dump(crc32("000DEADBEEF000"));

        // ton() converts a Toncoin string amount into nanoToncoins
        dump(ton("1"));
    }
    receive() {
        self.test();
    }
}
