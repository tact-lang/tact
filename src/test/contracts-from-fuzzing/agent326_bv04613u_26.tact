struct RemainingInner {
    data: Slice as remaining;
}

contract RemainingTest {
    s: RemainingInner;

    init() {
        self.s = RemainingInner{
            data: emptyCell().asSlice()
        };
    }
}
