struct S {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: String?;
}

contract MixedFull {
    data: S;

    init() {
        self.data = S{
            a: 5,
            b: true,
            c: "hi",
            d: null,
            e: null,
            f: null
        };
    }
}