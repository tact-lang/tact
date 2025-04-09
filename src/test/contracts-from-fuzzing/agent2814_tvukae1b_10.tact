struct A {
    a: Int;
}

struct B {
    b: Int;
}

struct C {
    a: A;
    b: B;
}

contract MultiNestedDiffStructsTest {
    data: C;

    init() {
        self.data = C {
            a: A { a: 1 },
            b: B { b: 2 }
        };
    }
}