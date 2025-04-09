struct ManyInts {
    val1: Int as uint8;
    val2: Int as uint16;
    val3: Int as uint32;
    val4: Int as uint64;
    val5: Int as uint128;
    val6: Int as int9;
    val7: Int as int33;
    val8: Int as int72;
    val9: Int as int255;
    val10: Int as int257;
}

contract TestManyInts {
    data: ManyInts;

    init() {
        self.data = ManyInts{
            val1: 1,
            val2: 2,
            val3: 3,
            val4: 4,
            val5: 5,
            val6: 6,
            val7: 7,
            val8: 8,
            val9: 9,
            val10: 10
        };
    }
}
