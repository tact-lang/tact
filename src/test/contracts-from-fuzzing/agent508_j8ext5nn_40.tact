struct TailRem {
    prefix: Int as uint8;
    content: Slice as remaining;
}

contract RemainTest {
    data: TailRem;
    init() {
        self.data = TailRem{
            prefix:5,
            content: emptyCell().asSlice()
        };
    }
}