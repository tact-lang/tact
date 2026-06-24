struct RemainingTail {
    start: Int;
    tail: Slice as remaining;
}

contract TestContract {
    r: RemainingTail;

    init() {
        self.r = RemainingTail{
            start: 5,
            tail: emptyCell().asSlice(),
        };
    }
}
