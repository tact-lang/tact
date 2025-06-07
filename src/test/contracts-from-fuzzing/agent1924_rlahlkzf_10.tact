struct RemainingField {
    prefix: Int as uint32;
    tail: Slice as remaining;
}

contract TestContract {
    data: RemainingField;

    init() {
        self.data = RemainingField{
            prefix: 1234,
            tail: emptyCell().asSlice()
        };
    }
}