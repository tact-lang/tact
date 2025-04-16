struct LongFlat {
    a: Int;
    b: Int;
    c: Int;
    d: Int;
    e: Bool;
    f: Bool;
    g: Bool;
    h: String;
    i: String;
    j: String;
    k: Address;
    l: Address;
    m: Cell;
    n: Cell;
    o: Slice;
    p: Slice;
    q: Int;
    r: Int;
    s: Bool;
    t: String;
}

contract LongFlatTest {
    data: LongFlat;

    init() {
        self.data = LongFlat{
            a: 1,
            b: 2,
            c: 3,
            d: 4,
            e: true,
            f: false,
            g: true,
            h: "h",
            i: "i",
            j: "j",
            k: myAddress(),
            l: myAddress(),
            m: emptyCell(),
            n: emptyCell(),
            o: emptyCell().asSlice(),
            p: emptyCell().asSlice(),
            q: 5,
            r: 6,
            s: true,
            t: "t"
        };
    }
}