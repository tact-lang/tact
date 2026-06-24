struct RemainingDemo {
    prefix: Int as uint8;
    payload: Slice as remaining;
}

contract StructWithRemaining {
    field: RemainingDemo;

    init() {
        self.field = RemainingDemo{
            prefix: 5,
            payload: emptyCell().asSlice()
        };
    }
}