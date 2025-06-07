struct SerRemain {
    a: Int;
    tail: Slice as remaining;
}

contract StructWithRemaining {
    data: SerRemain;

    init() {
        self.data = SerRemain{
            a: 10,
            tail: emptyCell().asSlice(),
        };
    }
}
