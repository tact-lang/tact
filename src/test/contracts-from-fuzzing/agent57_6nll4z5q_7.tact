struct BigS {
    a: Int;
    b: Bool;
    c: Address;
    d: Cell;
    e: Slice;
    f: String;
    g: Int;
    h: Bool;
}

contract BigNested {
    s: BigS;

    init() {
        self.s = BigS{
            a: 1,
            b: true,
            c: myAddress(),
            d: emptyCell(),
            e: emptyCell().asSlice(),
            f: "hi",
            g: 7,
            h: false
        };
    }
}