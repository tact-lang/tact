struct S {
    a: Int?;
    b: String?;
    c: Bool?;
    d: Int;
    e: String;
    f: Bool;
}

contract MixedOptPlain {
    sfield: S;
    init() {
        self.sfield = S{
            a: null, b: "s", c: null, d:42, e:"hi", f:true
        };
    }
}