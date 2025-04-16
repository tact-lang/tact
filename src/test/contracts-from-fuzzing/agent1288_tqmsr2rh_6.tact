struct ManyFields {
    a: Int;
    b: Bool?;
    c: String;
    d: Int?;
    e: Cell;
    f: Bool;
    g: Address?;
    h: Int;
    i: String?;
    j: Cell?;
}

contract TestContract {
    data: ManyFields;

    init() {
        self.data = ManyFields{
            a: 1,
            b: null,
            c: "test",
            d: -5,
            e: emptyCell(),
            f: true,
            g: null,
            h: 42,
            i: "optional",
            j: null
        };
    }
}