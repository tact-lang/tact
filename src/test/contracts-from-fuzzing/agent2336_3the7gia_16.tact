struct A {
    x: Int;
}

struct B {
    inner: A;
}

contract C {
    field: B;

    init() {
        self.field = B{ inner: A{ x: 77 } };
    }
}