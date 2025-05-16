struct RemainderTest {
    u: Int as uint8;
    rest: Slice as remaining;
}

contract UseRemainder {
    payload: RemainderTest;

    init() {
        self.payload = RemainderTest{
            u: 5,
            rest: emptyCell().asSlice(),
        };
    }
}
