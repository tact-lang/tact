struct NearMaxBits {
    big1: Int as uint256;
    big2: Int as uint256;
    big3: Int as uint256;
    big4: Int as uint256;
}

contract Test {
    data: NearMaxBits;

    init() {
        self.data = NearMaxBits{
            big1: 1,
            big2: 2,
            big3: 3,
            big4: 4,
        };
    }
}