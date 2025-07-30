struct RemainingFieldStruct {
    a: Int;
    rest: Slice as remaining;
}

contract RemainingFieldTest {
    data: RemainingFieldStruct;

    init() {
        self.data = RemainingFieldStruct{
            a: 123,
            rest: emptyCell().asSlice()
        };
    }
}