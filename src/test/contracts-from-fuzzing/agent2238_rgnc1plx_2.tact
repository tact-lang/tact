struct S {
    a: Int;
    b: String;
    c: Bool?;
    d: String?;
    e: Int?;
    f: Bool;
}

contract TestContract {
    s: S;
    
    init() {
        self.s = S{
            a: 11,
            b: "hi",
            c: null,
            d: "maybe",
            e: null,
            f: false,
        };
    }
}
