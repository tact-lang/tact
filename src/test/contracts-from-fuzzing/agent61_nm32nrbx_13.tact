struct PaddingTest {
    small1: Int as uint4;
    small2: Int as uint4;
    small3: Int as uint4;
    small4: Int as uint4;
    big1: Int;
    big2: Int as uint128;
}

contract TestContract {
    pad: PaddingTest;

    init() {
        self.pad = PaddingTest{
            small1: 1, small2:2, small3:3, small4:4, big1:12345, big2:67890
        };
    }
}