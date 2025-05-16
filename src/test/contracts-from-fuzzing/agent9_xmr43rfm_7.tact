contract FuzzCT {
    // Compile-time evaluated constants using built-in functions
    const C1: Int = ascii("⚡");           // expected: 14850721
    const C2: Int = ton("1");              // expected: 1000000000
    const C3: Int = crc32("000DEADBEEF000"); // expected: 1821923098
    const C4: Int = sha256("hey, I'll produce the SHA256 number at compile-time");
    const C5: Cell = cell("te6cckEBAQEAAgAAAEysuc0=");
    const C6: Slice = slice("te6cckEBAQEADgAAGEhlbGxvIHdvcmxkIXgtxbw=");
    const C7: Slice = rawSlice("000DEADBEEF000");
    const C8: Address = address("EQDtFpEwcFAEcRe5mLVh2N6C0x-_hJEM7W61_JLnSF74p4q2");

    // Function to dump compile-time constant values
    fun dumpConstants() {
        dump(self.C1);
        dump(self.C2);
        dump(self.C3);
        dump(self.C4);
        dump(self.C8);
        dump(self.C5);
        dump(self.C6);
        dump(self.C7);
    }

    // Receiver function to trigger dumpConstants
    receive() {
        self.dumpConstants();
    }
}
