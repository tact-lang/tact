struct S {
    a: Int;
    b: String?;
    c: Bool;
    d: String?;
}

contract ManyMixedNested {
    s: S;

    init() {
        self.s = S{ a: 1, b: "b", c: true, d: null };
    }
}