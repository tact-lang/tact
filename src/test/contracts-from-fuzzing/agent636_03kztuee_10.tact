struct LargeStruct {
    a: Int;
    b: Int?;
    c: Bool;
    d: Bool?;
    e: String;
    f: String?;
    g: Address;
    h: Address?;
    i: Cell;
    j: Cell?;
    k: Slice;
    l: Slice?;
    m: Builder;
    n: Int;
    o: Int?;
    p: Bool;
    q: Bool?;
    r: String;
    s: String?;
    t: Address;
    u: Address?;
    v: Cell;
    w: Cell?;
    x: Slice;
    y: Slice?;
    z: Builder;
}

contract LargeFieldsTest {
    bigData: LargeStruct;

    init() {
        self.bigData = LargeStruct{
            a: 1, b: null, c: true, d: null, e: "e", f: null,
            g: myAddress(), h: null, i: emptyCell(), j: null,
            k: emptyCell().asSlice(), l: null, m: beginCell(),
            n: 2, o: null, p: false, q: null, r: "r", s: null,
            t: myAddress(), u: null, v: emptyCell(), w: null,
            x: emptyCell().asSlice(), y: null, z: beginCell()
        };
    }
}
