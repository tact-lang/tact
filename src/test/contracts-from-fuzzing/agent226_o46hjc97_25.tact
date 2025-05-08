struct FlatPrimitives {
    i: Int;
    b: Bool;
    s: String;
    a: Address;
    c: Cell;
    sl: Slice;
}

contract TestFlatPrimitives {
    data: FlatPrimitives;

    init() {
        self.data = FlatPrimitives{
            i: 1,
            b: false,
            s: "s",
            a: myAddress(),
            c: emptyCell(),
            sl: emptyCell().asSlice()
        };
    }
}
