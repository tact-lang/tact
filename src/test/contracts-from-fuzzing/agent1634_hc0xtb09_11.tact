contract TestContract {
    big1: Int as uint64 = 1;
    big2: Int as uint128 = 2;
    big3: Int as uint256 = 3;
    small1: Int as uint1 = 1;
    small2: Int as uint4 = 2;

    init() {
        self.big1 = 42;
        self.big2 = 43;
        self.big3 = 44;
        self.small1 = 1;
        self.small2 = 2;
    }
}