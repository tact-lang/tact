struct ManyFields {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: String?;
    g: Address;
    h: Address?;
    i: Cell;
    j: Slice;
    k: Builder;
    l: Int;
    m: Bool;
    n: String;
    o: Int?;
    p: Bool?;
}

contract BigStorage {
    storage: ManyFields;

    init() {
        self.storage = ManyFields{
            a: 1,
            b: true,
            c: "hello",
            d: null,
            e: null,
            f: null,
            g: myAddress(),
            h: null,
            i: emptyCell(),
            j: emptyCell().asSlice(),
            k: beginCell(),
            l: 2,
            m: false,
            n: "world",
            o: null,
            p: null,
        };
    }
}