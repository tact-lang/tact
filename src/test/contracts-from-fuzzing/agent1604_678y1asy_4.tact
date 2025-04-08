struct BigInts {
    val1: Int as int8;
    val2: Int as int16;
    val3: Int as int32;
    val4: Int as int64;
    val5: Int as int128;
    val6: Int as int256;
    val7: Int as int257;
}

contract IntSizes {
    bigs: BigInts;

    init() {
        self.bigs = BigInts{
            val1: 0,
            val2: 0,
            val3: 0,
            val4: 0,
            val5: 0,
            val6: 0,
            val7: 0
        };
    }
}