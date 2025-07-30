contract Test {
  // Compile-time constants evaluation as contract-level constants
  const ASCI: Int = ascii("⚡"); // expected: 14850721 (0xE29AA1)
  const CRC: Int = crc32("hello, world"); // computed compile-time
  const TON: Int = ton("1"); // expected: 1000000000
  const MOON: Int = 1730 + (8 | 8); // expected: 1738

  receive() {
    // Dump compile-time constant values using self.[constant]
    dump(self.ASCI);
    dump(self.CRC);
    dump(self.TON);
    dump(self.MOON);

    // Use built-in compile-time functions for cell and slice conversion
    let c: Cell = cell("te6cckEBAQEAAgAAAEysuc0=");
    dump(c);
    let s: Slice = slice("te6cckEBAQEADgAAGEhlbGxvIHdvcmxkIXgtxbw=");
    dump(s);
    let r: Slice = rawSlice("000DEADBEEF000");
    dump(r);
  }
}
