struct A {
    x: Int;
    y: Bool;
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

contract Deep {
    val: D;

    init() {
        self.val = D{ c: C{ b: B{ a: A{ x:1, y:true } } } };
    }
}
