struct A {
    val: Int;
}

struct B {
    inner: A;
}

struct C {
    b: B;
}

contract DifferentOrder {
    z: Int;
    y: A;
    x: B;
    w: C;

    init() {
        self.z = 1;
        self.y = A{val:2};
        self.x = B{inner:A{val:3}};
        self.w = C{b:B{inner:A{val:4}}};
    }
}