struct Remain {
    header: Int;
    tail: Slice as remaining;
}

contract TestRemainingSlice {
    data: Remain;
    init() {
        self.data = Remain{
            header: 123,
            tail: emptyCell().asSlice()
        };
    }
}