struct A {
    x: Int;
}

struct B {
    a: A;
    value: Int;
}

struct C {
    b: B;
    flag: Bool;
}

contract DeepNestedTest {
    field: C;

    init() {
        self.field = C{
            b: B{ a: A{ x: 99 }, value: 42 },
            flag: true
        };
    }
}