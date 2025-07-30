struct LotOfBools {
    a: Bool;
    b: Bool;
    c: Bool;
    d: Bool;
    e: Bool;
    f: Bool;
    g: Bool;
    h: Bool;
    i: Bool;
    j: Bool;
    k: Bool;
    l: Bool;
    m: Bool;
    n: Bool;
    o: Bool;
    p: Bool;
}

contract PackedBoolsTest {
    state: LotOfBools;

    init() {
        self.state = LotOfBools{
            a: true, b: true, c: false, d: false, e: true, f: false, g: true,
            h: true, i: false, j: true, k: false, l: true, m: false, n: true,
            o: false, p: true
        };
    }
}