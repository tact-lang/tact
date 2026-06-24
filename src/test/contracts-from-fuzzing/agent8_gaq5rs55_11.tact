contract ExprCompileTime {
    fun test() {
        // Test compile-time evaluated expressions
        let a: Address = address("EQDtFpEwcFAEcRe5mLVh2N6C0x-_hJEM7W61_JLnSF74p4q2");
        dump(a);

        let c: Cell = cell("te6cckEBAQEAAgAAAEysuc0=");
        dump(c);

        let s: Slice = slice("te6cckEBAQEADgAAGEhlbGxvIHdvcmxkIXgtxbw=");
        dump(s);

        let r: Slice = rawSlice("000DEADBEEF000");
        dump(r);

        let ascii_val: Int = ascii("⚡");
        dump(ascii_val);

        let crc_val: Int = crc32("000DEADBEEF000");
        dump(crc_val);

        let ton_val: Int = ton("1");
        dump(ton_val);
    }

    receive() {
        self.test();
    }
}
