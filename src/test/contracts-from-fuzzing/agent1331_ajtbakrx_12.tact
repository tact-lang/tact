struct Complex {
    a: Int;
    b: Bool;
    c: Int as int64;
    d: String;
    e: Bool?;
    f: String;
    g: Int?;
    h: Bool;
    i: String;
    j: Int as uint32;
    k: Int;
}

contract BigStructStorage {
    payload: Complex = Complex{
        a: 1, b: false, c: -2, d: "d", e: null, f: "f", g: null, h: true, i: "i", j: 42, k: 100
    };
}