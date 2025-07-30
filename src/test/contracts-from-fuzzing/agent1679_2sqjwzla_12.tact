struct RemainingStruct {
    part: Int;
    rest: Slice as remaining;
}

contract RemainingTest {
    data: RemainingStruct;

    init() {
        self.data = RemainingStruct{
            part: 42,
            rest: emptyCell().asSlice(),
        };
    }
}