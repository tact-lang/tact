struct SeriesXX {
    i64: Int as int64;     // signed 64-bit integer
    u32: Int as uint32;    // unsigned 32-bit integer
    ufo51: Int as uint51;  // unsigned 51-bit integer
    maxi: Int as int257;   // explicitly serialized as int257
    lastFieldName: Cell as remaining; // remaining bits of the Slice
}

contract TestSeriesXX() {
    fun test() {
        // Construct a cell with some bits to use as the remaining field
        let rem: Cell = beginCell().storeUint(7, 3).endCell();
        // Instantiate the struct with specific values
        // Note: The chosen values should fit the specified bit-widths:
        // - int64: can hold -2^63 ... 2^63 -1. We choose -123456789
        // - uint32: up to 2^32-1. We choose 987654321
        // - uint51: up to 2^51-1. We choose 12345
        // - int257: full range. We choose 42.
        let series: SeriesXX = SeriesXX{
            i64: -123456789,
            u32: 987654321,
            ufo51: 12345,
            maxi: 42,
            lastFieldName: rem
        };
        dump(series.i64);
        dump(series.u32);
        dump(series.ufo51);
        dump(series.maxi);
    }
    receive() { self.test(); }
}
