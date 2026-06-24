struct L {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: String?;
    g: Int;
    h: Bool;
    i: String;
    j: Int?;
}

contract TestContract {
    rec: L = L{
        a: 1, b: true, c: "",
        d: null, e: null, f: null,
        g: 2, h: false, i: "abc", j: null
    };
}