struct S {
    a: Int;
    b: String;
    c: Bool;
    d: String?;
    e: Bool?;
}

contract MixedTypes {
    s: S;

    init() {
        self.s = S{
            a: 1,
            b: "hi",
            c: true,
            d: null,
            e: null
        };
    }
}
