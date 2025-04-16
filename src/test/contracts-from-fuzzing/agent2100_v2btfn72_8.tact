struct A {
    foo: Int;
}

struct B {
    bar: Int;
    nested: A;
}

struct C {
    alpha: Bool;
    beta: B;
}

contract Test {
    storage: C;
    init() {
        self.storage = C{
            alpha: true,
            beta: B{bar: 10, nested: A{foo:20}}
        };
    }
}