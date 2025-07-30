struct A {
    p: Bool;
}

struct B {
    q: A;
}

contract DiffNames {
    foo: A;
    bar: B;

    init() {
        self.foo = A{p: false};
        self.bar = B{q: A{p: true}};
    }
}
