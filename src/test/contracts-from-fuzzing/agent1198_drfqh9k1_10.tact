struct Sub {
    sx: Int;
    sy: Bool?;
}

struct Giant {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
    e: Slice;
    f: Cell?;
    g: String?;
    h: Int;
    i: Bool;
    j: Address?;
    k: Cell;
    l: Slice?;
    m: Sub;
    n: Bool;
    o: Int?;
    p: String;
    q: Address;
    r: Bool?;
    s: Cell;
    t: Int;
    u: Sub?;
    v: String?;
}

contract BigFields {
    g: Giant;

    init() {
        self.g = Giant{
            a: 1, b: false, c: "c", d: address("EQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAM9c"),
            e: emptyCell().asSlice(), f: null, g: null, h: 8, i: true, j: null,
            k: emptyCell(), l: null, m: Sub{ sx: 3, sy: true }, n: true, o: null,
            p: "end", q: address("EQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAM9c"),
            r: false, s: emptyCell(), t: -999, u: null, v: "hello"
        };
    }

    receive() {
        self.g = self.g;
    }
}