struct S { a: Int; }

contract OptionalStructs {
    s1: S? = null;
    s2: S? = null;

    init() {
        self.s1 = S{ a: 42 };
        self.s2 = null;
    }
}