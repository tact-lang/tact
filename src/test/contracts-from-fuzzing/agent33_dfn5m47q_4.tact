struct BigNumbers {
    big1: Int;
    big2: Int as uint256;
    big3: Int as int257;
    big4: Int as uint128;
    big5: Int as int128;
}

contract Test {
    data: BigNumbers;

    init() {
        self.data = BigNumbers{
            big1: 1,
            big2: 2,
            big3: 3,
            big4: 4,
            big5: 5
        };
    }
}