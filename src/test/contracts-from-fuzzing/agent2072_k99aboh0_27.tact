struct RemainingFieldTest {
    x: Int as int64;
    rest: Slice as remaining;
}

contract RemainingStruct {
    data: RemainingFieldTest;

    init() {
        self.data = RemainingFieldTest{
            x: 88,
            rest: emptyCell().asSlice(),
        };
    }
}