struct Str {
    a: Int;
    b: Int as uint32;
    c: Int as int64;
    d: Bool;
    e: String;
    f: Address;
    g: Cell;
    h: Slice;
}

contract WithSerialization {
    s: Str;

    init() {
        self.s = Str{
            a: 1,
            b: 2,
            c: 3,
            d: true,
            e: "abc",
            f: myAddress(),
            g: emptyCell(),
            h: emptyCell().asSlice()
        };
    }
}