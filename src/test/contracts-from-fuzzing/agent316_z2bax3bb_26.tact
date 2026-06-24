struct X {
    prefix: Int as uint32;
    suffix: Slice as remaining;
}

contract Test {
    data: X;

    init() {
        self.data = X{
            prefix: 1234,
            suffix: emptyCell().asSlice()
        };
    }
}
