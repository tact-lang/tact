struct TailRemaining {
    x: Int;
    payload: Slice as remaining;
}

contract TestContract {
    data: TailRemaining;

    init() {
        self.data = TailRemaining{
            x: 1,
            payload: emptyCell().asSlice()
        };
    }
}