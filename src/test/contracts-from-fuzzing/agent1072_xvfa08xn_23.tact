struct RemainingTest {
    a: Int;
    tail: Slice as remaining;
}

contract RemainStructTest {
    data: RemainingTest;

    init() {
        self.data = RemainingTest{ a:7, tail: emptyCell().asSlice() };
    }
}