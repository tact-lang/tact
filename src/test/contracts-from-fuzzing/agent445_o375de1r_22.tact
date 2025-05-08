// Very wide persistent struct with mixed optional and default
struct WideMix {
    a: Int?;
    b: Bool = false;
    c: String?;
    d: Int = 0;
    e: Bool?;
    f: String = "";
    g: Int?;
    h: Bool = true;
    i: String?;
    j: Int = 42;
}

contract WideMixed {
    big: WideMix = WideMix{
        a: null,
        c: null,
        e: null,
        g: null,
        i: null
    };
}
