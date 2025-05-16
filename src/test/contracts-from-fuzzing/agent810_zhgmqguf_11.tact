struct RemainingTest {
    a: Int;
    rest: Slice as remaining;
}

contract TestContract {
    data: RemainingTest;
    init() {
        self.data = RemainingTest{
            a: 42,
            rest: emptyCell().asSlice(),
        };
    }
}