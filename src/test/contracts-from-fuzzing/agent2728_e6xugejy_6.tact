struct A {
    i: Int;
}

struct B {
    a: A;
}

struct C {
    b: B;
}

contract Test {
    level: C;

    init() {
        self.level = C{b: B{a: A{i: 123}}};
    }
}
