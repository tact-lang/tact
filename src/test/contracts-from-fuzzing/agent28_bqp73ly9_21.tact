struct Numbers {
    int64Val: Int as int64;
    int32Val: Int as int32;
    uint4Val: Int as uint4;
    coinVal: Int as coins;
}

contract MultipleSerializationFormats {
    nums: Numbers;

    init() {
        self.nums = Numbers{
            int64Val: 42,
            int32Val: -42,
            uint4Val: 5,
            coinVal: ton("1"),
        };
    }
}