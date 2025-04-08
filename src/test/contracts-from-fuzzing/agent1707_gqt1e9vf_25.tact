struct Remain {
    head: Int;
    tail: Slice as remaining;
}

contract RemainingFieldTest {
    x: Remain;

    init() {
        self.x = Remain{ head: 42, tail: emptyCell().asSlice() };
    }
}