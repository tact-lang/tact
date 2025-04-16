struct SeriesX {
    i64: Int as int64;  // signed 64-bit integer
    u32: Int as uint32; // unsigned 32-bit integer
    ufo51: Int as uint51; // unsigned 51-bit integer
    maxi: Int as int257; // explicitly serialized as int257
    lastField: Cell as remaining; // remaining bits from the slice
}

contract TestAdvancedTypes {
    // Test conversion of struct with serialization options
    fun testSeries() {
        // Create a SeriesX instance with edge case values
        let s: SeriesX = SeriesX{
            i64: -9223372036854775808, // Minimum for int64
            u32: 4294967295,           // Maximum for uint32
            ufo51: 2251799813685247,    // Maximum for uint51: 2^51 - 1
            maxi: 123456789,           // arbitrary value
            lastField: "Advanced Test".asComment()
        };
        let cell = s.toCell();
        let s2 = SeriesX.fromCell(cell);
        dump(s2.i64);    // Expect: -9223372036854775808
        dump(s2.u32);    // Expect: 4294967295
        dump(s2.ufo51);  // Expect: 2251799813685247
        dump(s2.maxi);   // Expect: 123456789
        // Convert the 'lastField' Cell to a Slice to access its bit count
        let sliceField: Slice = s2.lastField.asSlice();
        dump(sliceField.bits());  // Print bit-length of the remaining field
    }

    receive() {
        self.testSeries();
        cashback(sender());
    }
}
