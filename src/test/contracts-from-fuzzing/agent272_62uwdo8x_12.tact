struct TailMe {
    head: Int as uint8;
    tail: Slice as remaining;
}

contract TestRemainingField {
    data: TailMe;

    init() {
        self.data = TailMe{
            head: 255,
            tail: emptyCell().asSlice()
        };
    }
}