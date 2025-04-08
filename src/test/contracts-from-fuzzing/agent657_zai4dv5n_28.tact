struct S {
    a: Int?;
    b: Int;
    c: Bool?;
    d: Bool;
    e: String?;
    f: String;
    g: Address?;
    h: Address;
}

contract OptMix {
    s: S;

    init() {
        self.s = S{
            a: null, b: 1, c: null, d: true, e: "hi", f: "bye", g: null, h: myAddress()
        };
    }
}