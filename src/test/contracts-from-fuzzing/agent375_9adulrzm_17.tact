struct TailRemainder {
    prefix: Int;
    content: Slice as remaining;
}

contract TestContract {
    data: TailRemainder;

    init() {
        self.data = TailRemainder{
            prefix: 1,
            content: emptyCell().asSlice()
        };
    }
}
