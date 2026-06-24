struct RemainderTest {
    num: Int;
    tail: Slice as remaining;
}

contract HasRemaining {
    data: RemainderTest;
    init() {
        self.data = RemainderTest{num:5, tail:emptyCell().asSlice()};
    }
}