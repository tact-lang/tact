struct RemainderTest {
    foo: Int;
    rem: Slice as remaining;
}

contract RemainderContract {
    x: RemainderTest;

    init() {
        self.x = RemainderTest{
            foo: 42,
            rem: emptyCell().asSlice(),
        };
    }
}