struct LargeStruct {
    a: Int;
    b: Bool;
    c: Cell;
    d: Slice;
    e: String;
    f: Int?;
    g: String?;
    h: Bool;
    i: Int;
    j: Bool;
    k: Int?;
    l: Bool;
    m: String;
    n: Int;
    o: Bool;
}

contract LargeStorage {
    s: LargeStruct;

    init() {
        self.s = LargeStruct{
            a: 1,
            b: true,
            c: emptyCell(),
            d: emptyCell().asSlice(),
            e: "hello",
            f: null,
            g: null,
            h: false,
            i: 2,
            j: true,
            k: null,
            l: false,
            m: "world",
            n: 3,
            o: true,
        };
    }
}
