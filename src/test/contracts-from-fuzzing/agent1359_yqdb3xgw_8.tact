struct HugeStruct {
    a: Int;
    b: Int as uint32;
    c: Bool;
    d: Bool?;
    e: String;
    f: String?;
    g: Slice;
    h: Slice?;
    i: Cell;
    j: Cell?;
    k: Address;
    l: Address?;
    m: Int as int8;
    n: Int?;
    o: Int as uint64;
    p: Bool;
    q: String;
    r: Slice;
    s: Cell;
    t: Address;
}

contract HugeStorage {
    field: HugeStruct;

    init() {
        self.field = HugeStruct{
            a: 1,
            b: 2,
            c: true,
            d: false,
            e: "str",
            f: null,
            g: emptyCell().asSlice(),
            h: null,
            i: emptyCell(),
            j: null,
            k: myAddress(),
            l: null,
            m: 3,
            n: null,
            o: 4,
            p: true,
            q: "abc",
            r: emptyCell().asSlice(),
            s: emptyCell(),
            t: myAddress(),
        };
    }
}