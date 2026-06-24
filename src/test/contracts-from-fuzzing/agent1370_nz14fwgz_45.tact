// persistent storage combining everything
struct S {
    a: Int;
    b: Int?;
    c: Bool;
    d: Bool?;
    e: String;
    f: String?;
}

contract Everything {
    big: S;
    optBig: S?;
    flag: Bool?;

    init() {
        self.big = S{
            a: 1,
            b: null,
            c: false,
            d: null,
            e: "str",
            f: null
        };
        self.optBig = null;
        self.flag = null;
    }
}