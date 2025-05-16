struct A {
    x: Int;
}

struct B {
    y: Int;
    a: A;
}

struct C {
    z: Int;
    b: B;
}

struct D {
    k: Int;
    c: C;
}

contract DeepFour {
    d: D;

    init() {
        self.d = D{k:1,c:C{z:2,b:B{y:3,a:A{x:4}}}};
    }
}