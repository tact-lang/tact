struct Numbers {
    i8: Int as int8;
    u8: Int as uint8;
    i64: Int as int64;
    u64: Int as uint64;
    coinsVal: Int as coins;
}

contract SerializeTest {
    nums: Numbers;
    init() {
        self.nums = Numbers{
            i8: -5,
            u8: 200,
            i64: -123456789,
            u64: 123456789,
            coinsVal: 1000000
        };
    }
}