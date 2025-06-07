struct RemainingTest {
    x: Int;
    rest: Slice as remaining;
}

contract Test {
    val: RemainingTest;

    init() {
        self.val = RemainingTest{
            x: 1,
            rest: emptyCell().asSlice()
        };
    }
}