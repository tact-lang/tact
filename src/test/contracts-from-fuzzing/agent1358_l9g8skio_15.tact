struct RemainTest {
    a: Int;
    rest: Slice as remaining;
}

contract RemainingContract {
    data: RemainTest;

    init() {
        self.data = RemainTest {
            a:5,
            rest: emptyCell().asSlice()
        };
    }
}