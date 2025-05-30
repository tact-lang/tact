struct RemainingTest {
    prefix: Int as uint32;
    tail: Slice as remaining;
}

contract TestContract {
    data: RemainingTest;

    init() {
        self.data = RemainingTest{
            prefix: 1234,
            tail: emptyCell().asSlice()
        };
    }
}