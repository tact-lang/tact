struct PartOpt {
    a: Int;
    b: Int?;
    c: Bool;
    d: String?;
    e: Int;
    f: String?;
    g: Bool;
    h: Int?;
    i: Bool;
    j: String?;
}

contract TestContract {
    s: PartOpt = PartOpt{
        a: 1,
        b: null,
        c: false,
        d: null,
        e: 2,
        f: null,
        g: true,
        h: null,
        i: false,
        j: null,
    };

    init() {}
}