struct RemTest {
    a: Int;
    tail: Slice as remaining;
}

contract RemainingField {
    data: RemTest;

    init() {
        self.data = RemTest{
            a: 5,
            tail: emptyCell().asSlice()
        };
    }
}