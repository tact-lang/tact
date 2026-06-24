struct S {
    a: Int;
    b: Bool;
    c: Address;
    d: String;
    e: Int?;
    f: Bool?;
    g: String?;
    h: Address?;
}

contract ManyOptionals {
    s: S;

    init() {
        self.s = S{
            a: 1,
            b: false,
            c: myAddress(),
            d: "abc",
            e: null,
            f: null,
            g: null,
            h: null
        };
    }
}
