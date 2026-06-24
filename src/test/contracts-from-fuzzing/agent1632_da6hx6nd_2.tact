struct ManyFields {
    a: Int;
    b: Bool;
    c: Cell;
    d: Slice;
    e: Address;
    f: String;
    g: Bool?;
    h: Int?;
    i: Cell?;
    j: Slice?;
    k: Address?;
    l: String?;
}

contract Test {
    data: ManyFields;

    init() {
        self.data = ManyFields{
            a: 1,
            b: true,
            c: emptyCell(),
            d: emptyCell().asSlice(),
            e: myAddress(),
            f: "test",
            g: false,
            h: 2,
            i: emptyCell(),
            j: emptyCell().asSlice(),
            k: myAddress(),
            l: "optional"
        };
    }
}