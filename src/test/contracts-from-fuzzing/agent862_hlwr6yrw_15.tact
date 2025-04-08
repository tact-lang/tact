struct RemainingTest {
    a: Int;
    tail: Slice as remaining;
}

contract UseRemaining {
    s: RemainingTest;

    init() {
        self.s = RemainingTest{
            a: 42,
            tail: emptyCell().asSlice()
        };
    }
}
