struct ManyFields {
    a: Int;
    b: Bool;
    c: String;
    d: Int;
    e: Bool;
    f: String;
    g: Int;
    h: Bool;
    i: String;
    j: Int;
    k: Bool;
    l: String;
    m: Int;
    n: Bool;
    o: String;
}

contract WideFields {
    s: ManyFields;

    init() {
        self.s = ManyFields{
            a: 1, b: false, c: "c",
            d: 2, e: true, f: "f",
            g: 3, h: false, i: "i",
            j: 4, k: true, l: "l",
            m: 5, n: false, o: "o"
        };
    }
}
