struct S {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: String?;
}

contract DefaultsToNull {
    s: S;

    init() {
        self.s = S{
            a: 5,
            b: true,
            c: "ok",
            d: null,
            e: null,
            f: null
        };
    }
}