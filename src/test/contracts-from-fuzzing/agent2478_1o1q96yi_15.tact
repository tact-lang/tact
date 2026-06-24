struct S {
    a: Int;
    b: Bool?;
    c: String;
}

contract NestedWithOptionals {
    s: S;

    init() {
        self.s = S{ a: 12, b: null, c: "nest" };
    }
}