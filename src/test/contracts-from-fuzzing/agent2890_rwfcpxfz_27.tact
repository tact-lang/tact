struct S1 {
    a: Int;
}

contract AssignNestedFields {
    s: S1;

    init() {
        self.s = S1{ a:1 };
        self.s.a = 42;
    }
}