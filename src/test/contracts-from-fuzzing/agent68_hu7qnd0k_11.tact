struct GoodRemain {
    prefix: Int;
    suffix: Slice as remaining;
}

contract ValidRem {
    val: GoodRemain;

    init() {
        self.val = GoodRemain{
            prefix: 123,
            suffix: emptyCell().asSlice()
        };
    }
}
