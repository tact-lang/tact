struct RemainingField {
    prefix: Int as uint32;
    suffix: Slice as remaining;
}

contract TestContract {
    s: RemainingField;
    init() {
        self.s = RemainingField{
            prefix: 1234,
            suffix: emptyCell().asSlice(),
        };
    }
}
