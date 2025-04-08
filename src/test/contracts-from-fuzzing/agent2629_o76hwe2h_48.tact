struct S2 {
    a: Int;
    b: Int = 42;
}

contract NestedWithDefault {
    f: S2;

    init() {
        self.f = S2{ a:5 };
    }
}