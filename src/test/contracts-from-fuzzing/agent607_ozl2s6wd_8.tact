struct Big {
    a: Int;
    b: Bool;
    c: Address;
    d: String;
    e: Slice;
    f: Builder;
    g: Cell;
    h: Int?;
    i: Bool;
    j: Address;
    k: String;
    l: Slice;
    m: Builder;
    n: Cell;
    o: Int;
}

contract BigStructTest {
    big: Big;
    init() {
        self.big = Big{
            a: 1, b: true, c: myAddress(), d: "hi", e: emptyCell().asSlice(), f: beginCell(), g: emptyCell(),
            h: null, i: false, j: myAddress(), k: "bye", l: emptyCell().asSlice(), m: beginCell(), n: emptyCell(),
            o: 777
        };
    }
}