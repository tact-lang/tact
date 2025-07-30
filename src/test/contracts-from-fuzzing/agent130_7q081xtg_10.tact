// Same as above, adding optional fields mixed with primitives
struct WideMixed {
    a: Int = 1;
    b: Bool?;
    c: Int?;
    d: String = "";
    e: Bool = false;
    f: String?;
    g: Int = 7;
    h: Bool = true;
    i: String = "yo";
    j: Int?;
}

contract TestContract {
    wide: WideMixed;

    init() {
        self.wide = WideMixed{
            a: 2, b: null, c: null, d: "ok", e: true,
            f: null, g: 8, h: false, i: "hey", j: null
        };
    }

    receive() {
        self.wide = self.wide;
    }
}