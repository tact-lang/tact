struct ManyFields {
    a: Int;
    b: Bool;
    c: String;
    d: Slice;
    e: Cell;
    f: Builder;
    g: Int?;
    h: Bool?;
    i: String;
    j: Int;
    k: Bool;
    l: Int?;
}

contract StructStorage {
    data: ManyFields;

    init() {
        self.data = ManyFields{
            a: 1,
            b: true,
            c: "hi",
            d: emptyCell().asSlice(),
            e: emptyCell(),
            f: beginCell(),
            g: null,
            h: false,
            i: "end",
            j: 100,
            k: true,
            l: 50
        };
    }
}