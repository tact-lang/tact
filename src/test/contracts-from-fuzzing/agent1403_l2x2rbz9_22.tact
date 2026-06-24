struct S {
    a: Int;
    b: Bool?;
    c: String;
}

contract NestedS {
    s: S;

    init() {
        self.s = S{ a: 1, b: null, c: "" };
    }
}