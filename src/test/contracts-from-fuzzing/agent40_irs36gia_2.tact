struct A {
    b: B;
}

struct B {
    c: C;
}

struct C {
    d: D;
}

struct D {
    val: Int;
}

contract DeepNest {
    nested: A;

    init() {
        self.nested = A{b:B{c:C{d:D{val:42}}}};
    }
}