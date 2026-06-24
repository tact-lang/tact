contract RawSliceTest {
    // Using rawSlice("4a") should create a Slice with the hex value 0x4a
    const S: Slice = rawSlice("4a");

    receive() {
         // Load 8 bits (one byte) from the slice. It should result in the integer 0x4a i.e. 74
         let x: Int = self.S.loadUint(8);
         require(x == 0x4a, "rawSlice(\"4a\") did not load as expected");
         cashback(sender());
    }
}
