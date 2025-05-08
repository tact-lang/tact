struct RemainTest {
    num: Int;
    tail: Slice as remaining;
}

contract RemainingField {
    data: RemainTest;

    init() {
        self.data = RemainTest{
            num: 0,
            tail: emptyCell().asSlice()
        };
    }
}