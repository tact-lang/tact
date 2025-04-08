struct Set {
    val1: Int as uint4;
    val2: Int as uint8;
    val3: Int as int16;
    val4: Int as int32;
    val5: Int as int64;
    val6: Int as uint120;
    val7: Int as int257;
}

contract RangeTest {
    set: Set;

    init() {
        self.set = Set{
            val1: 1,
            val2: 2,
            val3: 3,
            val4: 4,
            val5: 5,
            val6: 6,
            val7: 7
        };
    }
}