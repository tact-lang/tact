struct Wide {
    a: Int;
    b: Bool;
    c: String;
    d: Slice;
    e: Cell;
    f: Int;
    g: String;
    h: Bool;
    i: Int?;
    j: Bool?;
    k: String;
    l: Cell;
}

contract ManyFields {
    state: Wide;

    init() {
        self.state = Wide{
            a: 1,
            b: true,
            c: "abc",
            d: emptyCell().asSlice(),
            e: emptyCell(),
            f: 2,
            g: "def",
            h: false,
            i: null,
            j: null,
            k: "ghi",
            l: emptyCell()
        };
    }
}
