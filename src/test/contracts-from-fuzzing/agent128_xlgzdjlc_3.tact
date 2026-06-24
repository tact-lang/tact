struct ManyFields {
    a: Int;
    b: Int;
    c: Int;
    d: Bool;
    e: Bool;
    f: Bool;
    g: Int;
    h: Int;
    i: Bool;
    j: Bool;
    k: Int;
    l: Int;
    m: Bool;
    n: Bool;
    o: Int;
    p: Bool;
}

contract TestContract {
    storage: ManyFields;

    init() {
        self.storage = ManyFields{
            a: 1, b: 2, c: 3, d: true, e: false, f: true,
            g: 7, h: 8, i: false, j: true, k: 11,
            l: 12, m: false, n: true, o: 15, p: false
        };
    }
}