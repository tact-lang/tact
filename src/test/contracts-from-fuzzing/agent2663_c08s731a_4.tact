struct ManyFields {
    a: Int;
    b: Bool;
    c: String;
    d: Cell;
    e: Slice;
    f: Builder;
    g: Address;
    h: Bool?;
    i: Int?;
    j: String;
    k: Int;
    l: Int;
    m: Int;
    n: Int;
    o: Int;
}

contract BigStorage {
    data: ManyFields;

    init() {
        self.data = ManyFields{
            a: 1,
            b: true,
            c: "str",
            d: emptyCell(),
            e: emptyCell().asSlice(),
            f: beginCell(),
            g: myAddress(),
            h: null,
            i: null,
            j: "s",
            k: 2,
            l: 3,
            m: 4,
            n: 5,
            o: 6
        };
    }
}