struct D {
    x: Int;
}

struct C {
    d: D;
}

struct B {
    c: C;
}

struct A {
    b: B;
}

contract TestContract {
    val: A;

    init() {
        self.val = A{b:B{c:C{d:D{x:5}}}};
    }

    receive() {}
}