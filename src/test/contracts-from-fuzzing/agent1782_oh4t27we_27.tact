struct InnerRemain {
    x: Int as uint8;
    tail: Slice as remaining;
}

contract RemSliceTest {
    s: InnerRemain;

    init() {
        self.s = InnerRemain{
            x: 5,
            tail: emptyCell().asSlice()
        };
    }
}