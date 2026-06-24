struct Num {
    bigNum: Int as uint128;
    smallNum: Int as uint8;
}

contract TestContract {
    nums: Num;

    init() {
        self.nums = Num{
            bigNum: 123456789012345678901234567890,
            smallNum: 255,
        };
    }
}