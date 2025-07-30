struct BigNumbers {
    val1: Int as uint256;
    val2: Int as int257;
    val3: Int as uint128;
}

contract BigTest {
    nums: BigNumbers;
    init() {
        self.nums = BigNumbers{
            val1: 0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF,
            val2: -1,
            val3: 340282366920938463463374607431768211455
        };
    }
}
