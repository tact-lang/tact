struct S1 {
    a: Int;
    b: Bool;
    c: String;
    d: Cell;
    e: Slice;
    f: Address;
    g: String;
}

contract Test3 {
    s: S1;

    init() {
        self.s = S1{
            a: 5,
            b: true,
            c: "hi",
            d: emptyCell(),
            e: emptyCell().asSlice(),
            f: myAddress(),
            g: "world",
        };
    }
}