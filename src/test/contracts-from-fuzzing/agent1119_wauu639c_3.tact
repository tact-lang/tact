struct A {
    x: Int;
}

struct B {
    a: A;
}

struct C {
    b: B;
}

contract NestedDeep {
    state: C;

    init() {
        self.state = C{b: B{a: A{x: 123} }};
    }
}