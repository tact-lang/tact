struct InnerRem {
    prefix: Int;
    rest: Slice as remaining;
}

contract HasRemaining {
    val: InnerRem;

    init() {
        self.val = InnerRem{
            prefix: 42,
            rest: emptyCell().asSlice()
        };
    }
}
