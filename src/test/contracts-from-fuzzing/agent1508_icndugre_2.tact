struct LargeFields {
    a: Int;
    b: Bool;
    c: String;
    d: Cell;
    e: Slice;
    f: Bool;
    g: Int;
    h: String;
    i: Address;
    j: Slice;
    k: Bool;
    l: Int;
    m: String;
    n: Cell;
}

contract LargeStorage {
    data: LargeFields;

    init() {
        self.data = LargeFields{
            a: 1,
            b: false,
            c: "abc",
            d: emptyCell(),
            e: emptyCell().asSlice(),
            f: true,
            g: 100,
            h: "def",
            i: myAddress(),
            j: emptyCell().asSlice(),
            k: true,
            l: -123,
            m: "ghi",
            n: emptyCell(),
        };
    }
}
