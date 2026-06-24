struct Remaining {
    data: Slice as remaining;
}

contract RemainingTest {
    s: Remaining;

    init() {
        self.s = Remaining{
            data: emptyCell().asSlice()
        };
    }
}