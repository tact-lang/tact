struct A {
    x: Int;
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

contract Combination {
    d: D;
    extraInt: Int;
    extraBool: Bool;

    init() {
        self.d = D{c: C{b: B{a: A{x: 1}}}};
        self.extraInt = 2;
        self.extraBool = true;
    }
}