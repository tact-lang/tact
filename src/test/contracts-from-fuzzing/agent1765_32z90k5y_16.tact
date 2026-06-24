struct Inner {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: String?;
}

struct Outer {
    g: Int;
    h: Bool;
    i: String;
    j: Int?;
    k: Bool?;
    l: String?;
    inner: Inner;
}

contract NestedLarge {
    s: Outer;

    init() {
        self.s = Outer{
            g: 7, h: true, i: "a",
            j: null, k: false, l: null,
            inner: Inner{
                a: 1, b: false, c: "b",
                d: null, e: true, f: "c",
            }
        };
    }
}