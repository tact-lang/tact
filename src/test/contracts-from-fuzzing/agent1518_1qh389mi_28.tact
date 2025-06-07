struct RemainderTest {
    header: Int as uint16;
    rest: Slice as remaining;
}

contract RemainExample {
    val: RemainderTest;

    init() {
        self.val = RemainderTest {
            header: 1234,
            rest: emptyCell().asSlice()
        };
    }
}