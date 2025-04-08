struct S {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
    e: Cell;
    f: Slice;
    g: Bool;
    h: String;
    i: Int;
    j: Bool;
}

contract ManyDifferentFields {
    rec: S;

    init() {
        self.rec = S{
            a: 1,
            b: true,
            c: "hi",
            d: myAddress(),
            e: emptyCell(),
            f: emptyCell().asSlice(),
            g: false,
            h: "bye",
            i: -99,
            j: true
        };
    }
}