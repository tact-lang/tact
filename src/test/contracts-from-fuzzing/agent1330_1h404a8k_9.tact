struct Big {
    f1: Int;
    f2: Int;
    f3: Bool;
    f4: Address;
    f5: String;
    f6: Cell;
    f7: Slice;
    f8: Int;
}

contract HasBig {
    big: Big;

    init() {
        self.big = Big{
            f1: 11,
            f2: 22,
            f3: true,
            f4: myAddress(),
            f5: "hi",
            f6: emptyCell(),
            f7: emptyCell().asSlice(),
            f8: 33,
        };
    }
    receive() {}
}
