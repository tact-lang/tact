struct S {
    a: Int;
    b: Bool;
    c: Int?;
    d: Bool?;
    e: String;
    f: String?;
}

contract MixFields {
    state: S;

    init() {
        self.state = S{
            a: 1, b: true, c: null, d: false, e: "x", f: null
        };
    }
}