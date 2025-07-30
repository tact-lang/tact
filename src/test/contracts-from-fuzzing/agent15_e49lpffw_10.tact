struct Child1 {
    v1: Int;
    v2: Bool;
}

struct Child2 {
    v3: Int;
    v4: Bool;
}

struct Parent {
    c1: Child1;
    c2: Child2;
}

contract Composition {
    p: Parent;

    init() {
        self.p = Parent{
            c1: Child1{ v1: 10, v2: false },
            c2: Child2{ v3: 20, v4: true }
        };
    }
}