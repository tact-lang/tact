struct S {
    a: Int as int64;
    b: Int as uint32;
    c: Bool;
    d: Address;
    e: String;
    f: Cell;
    g: Slice;
    h: Int?;
    i: Bool?;
    j: Address?;
    k: String?;
    l: Cell?;
    m: Slice?;
}

contract TestContract {
    data: S;

    init() {
        self.data = S{
            a: -42,
            b: 123456,
            c: false,
            d: myAddress(),
            e: "test",
            f: emptyCell(),
            g: emptyCell().asSlice(),
            h: null,
            i: null,
            j: null,
            k: null,
            l: null,
            m: null
        };
    }
}