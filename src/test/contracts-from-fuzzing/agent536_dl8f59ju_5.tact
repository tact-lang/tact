struct DenseNums {
    i8: Int as int8;
    u7: Int as uint7;
    u32: Int as uint32;
    i64: Int as int64;
}

contract NumTest {
    nums: DenseNums;

    init() {
        self.nums = DenseNums{
            i8: -3,
            u7: 5,
            u32: 42,
            i64: -100000
        };
    }
}