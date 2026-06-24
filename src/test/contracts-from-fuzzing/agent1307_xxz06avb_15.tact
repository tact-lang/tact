struct S {
    a: Int;
    b: Bool;
    c: String;
}

contract InitEmptyThenSet {
    s: S = S{ a: 0, b: false, c: "" };

    init() {
        self.s = S{ a: 10000, b: true, c: "filled" };
    }
}