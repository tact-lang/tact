struct A {
    x: Int;
}

struct B {
    y: Int;
}

struct C {
    a: A;
    b: B;
}

contract Combo {
    field: C;
    init() {
        self.field = C{ a: A{ x:1 }, b:B{ y:2 } };
    }
}