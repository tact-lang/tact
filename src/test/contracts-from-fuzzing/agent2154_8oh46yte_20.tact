struct BoundsTest {
    small: Int as uint4;
    big: Int as uint256;
}

contract BoundsContract {
    b: BoundsTest;

    init() {
        self.b = BoundsTest{small:15, big: (1 << 255) -1};
    }
}