// Extremely large single struct with diverse fields
struct Huge {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
    e: Int?;
    f: Bool?;
    g: String?;
    h: Address?;
    i: Int;
    j: Bool;
    k: String;
    l: Address;
    m: Int?;
    n: Bool?;
    o: String?;
    p: Address?;
    q: Int;
    r: Bool;
    s: String;
    t: Address;
}

contract MaxFieldsTest {
    big: Huge;

    init() {
        self.big = Huge{
            a: 1, b: true, c: "c", d: myAddress(),
            e: null, f: null, g: null, h: null,
            i: 2, j: false, k: "k", l: myAddress(),
            m: null, n: null, o: null, p: null,
            q: 3, r: true, s: "s", t: myAddress()
        };
    }
}