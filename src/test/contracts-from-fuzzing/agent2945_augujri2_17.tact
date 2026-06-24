struct S {
    a: Int;
    b: Int?;
    c: Bool;
    d: Bool?;
    e: String;
}

contract Mixed {
    s: S;

    init() {
        self.s = S{a: 1, b: null, c: true, d: null, e: "test"};
    }
}