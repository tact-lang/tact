struct ManyFields {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
    e: Cell;
    f: Bool?;
    g: Int?;
    h: String;
    i: Address;
    j: Cell;
}

contract Test {
    data: ManyFields;
    init() {
        self.data = ManyFields{
            a: 1,
            b: false,
            c: "abc",
            d: myAddress(),
            e: emptyCell(),
            f: null,
            g: null,
            h: "def",
            i: myAddress(),
            j: emptyCell()
        };
    }
}