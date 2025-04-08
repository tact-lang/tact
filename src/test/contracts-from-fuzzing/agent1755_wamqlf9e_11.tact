struct TailRemaining {
    a: Int;
    b: String;
    c: Slice as remaining;
}

contract RemainingTest {
    payload: TailRemaining;

    init() {
        self.payload = TailRemaining {
            a: 1,
            b: "stuff",
            c: emptyCell().asSlice()
        };
    }
}