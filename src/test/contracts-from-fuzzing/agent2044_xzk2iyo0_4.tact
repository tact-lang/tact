struct LargeTest {
    a: Int;
    b: Int;
    c: Int;
    d: Int;
    e: String;
    f: String;
    g: Bool;
    h: Bool?;
    i: Int?;
    j: Bool;
    k: String;
    l: Int;
    m: String;
    n: Int?;
}

contract ManyFields {
    data: LargeTest;
    init() {
        self.data = LargeTest{
            a: 1, b: 2, c: 3, d: 4, e: "e",
            f: "f", g: true, h: null, i: null, j: false,
            k: "k", l: 12, m: "m", n: null,
        };
    }
}