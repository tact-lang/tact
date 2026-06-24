struct RemainingField {
    a: Int as uint32;
    rest: Slice as remaining;
}

contract RemainingFieldTest {
    data: RemainingField;
    init() {
        self.data = RemainingField{
            a: 42,
            rest: emptyCell().asSlice()
        };
    }
}