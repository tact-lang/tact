struct A {
    value: Int;
}

struct B {
    a: A;
}

struct C {
    b: B;
}

struct D {
    c: C;
}

contract Deepest {
    val: D;

    init() {
        self.val = D{c: C{b: B{a: A{value: 42}}}};
    }
}