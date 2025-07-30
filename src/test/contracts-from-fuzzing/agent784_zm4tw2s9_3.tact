struct LargeStruct {
    a: Int;
    b: Bool;
    c: String;
    d: Cell;
    e: Slice;
    f: Address;
    g: Int?;
    h: Bool?;
    i: String;
    j: Int;
    k: Bool;
    l: String;
    m: Cell;
    n: Slice;
    o: Address;
    p: Int?;
    q: Bool?;
    r: String;
    s: Int;
    t: Bool;
}

contract BigContract {
    big: LargeStruct;

    init() {
        self.big = LargeStruct{
            a: 1, b: true, c: "a", d: emptyCell(), e: emptyCell().asSlice(),
            f: myAddress(), g: null, h: false, i: "b", j: 2, k: false,
            l: "c", m: emptyCell(), n: emptyCell().asSlice(),
            o: myAddress(), p: null, q: true, r: "d", s: 3, t: true
        };
    }
}