struct ManyMixed {
    a: Int;
    b: Bool;
    c: String;
    d: Cell;
    e: Address;
    f: Slice;
}

contract TestMixed {
    val: ManyMixed;
    init() {
        self.val = ManyMixed{
            a: 1,
            b: true,
            c: "hi",
            d: emptyCell(),
            e: myAddress(),
            f: emptyCell().asSlice()
        };
    }
}