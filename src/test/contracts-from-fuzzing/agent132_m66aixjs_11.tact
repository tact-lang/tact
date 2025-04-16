// Many optional nested simple types
struct S {
    a: Int?;
    b: Bool?;
    c: Int?;
    d: Bool?;
    e: String?;
}

contract Opts {
    s: S?;

    init() {
        self.s = S{
            a: null,
            b: null,
            c: 1,
            d: null,
            e: "s",
        };
    }
}