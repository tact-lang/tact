struct IntFmt {
    tiny: Int as uint4;
    big: Int as int64;
    huge: Int;
}

contract IntSerial {
    nums: IntFmt;

    init() {
        self.nums = IntFmt{
            tiny: 7,
            big: 1234567890,
            huge: 999999999999999
        };
    }
}