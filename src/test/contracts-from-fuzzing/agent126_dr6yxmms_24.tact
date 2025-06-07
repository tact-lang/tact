struct RemainderTest {
    first: Int as uint8;
    payload: Slice as remaining;
}

contract RemainderFieldTest {
    val: RemainderTest;

    init() {
        self.val = RemainderTest{
            first: 42,
            payload: emptyCell().asSlice()
        };
    }
}