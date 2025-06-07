struct A {
    b: B;
}

struct B {
    c: C;
}

struct C {
    d: Int;
    e: String;
}

contract DeepNest {
    data: A;
    init() {
        self.data = A{b: B{c: C{d: 42, e: "deep"}}};
    }
}
