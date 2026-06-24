struct RemainingField {
    prefix: Int as uint32;
    suffix: Slice as remaining;
}

contract TestContract {
    data: RemainingField;

    init() {
        self.data = RemainingField{
            prefix: 123456,
            suffix: emptyCell().asSlice(),
        };
    }
}
