// Struct with many optionals
struct ManyOpts {
    a: Int?;
    b: Int?;
    c: Int?;
    d: String?;
    e: String?;
    f: Bool?;
    g: Bool?;
    h: Int?;
    i: Bool?;
    j: String?;
}

contract Test {
    mo: ManyOpts = ManyOpts{
        a: null,
        b: null,
        c: null,
        d: null,
        e: null,
        f: null,
        g: null,
        h: null,
        i: null,
        j: null,
    };

    init() {}
}