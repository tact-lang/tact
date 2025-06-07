struct S1 {
    a: Int;
}

struct S2 {
    s1: S1;
}

contract OverwriteTest {
    foo: Int = 0;
    bar: S2;

    init() {
        self.foo = 1000;
        self.bar = S2{ s1: S1{ a: 123 } };
        self.foo = 5678;
    }
}