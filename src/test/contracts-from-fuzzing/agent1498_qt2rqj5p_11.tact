struct LargeNumbers {
    i64: Int as int64;
    u64: Int as uint64;
    bigSigned: Int;
    bigUnsigned: Int as uint256;
}

contract TestContract {
    nums: LargeNumbers;

    init() {
        self.nums = LargeNumbers{
            i64: -1234567890,
            u64: 1234567890,
            bigSigned: -98765432109876543210,
            bigUnsigned: 98765432109876543210
        };
    }
}
