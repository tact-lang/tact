struct RemainFieldTest {
    prefix: Int as uint8;
    rest: Slice as remaining;
}

contract TestContract {
    storage: RemainFieldTest;

    init() {
        self.storage = RemainFieldTest{
            prefix: 255,
            rest: emptyCell().asSlice()
        };
    }
}