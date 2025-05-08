struct A {
    x: Int;
}

struct B {
    a: A;
    y: Int;
}

contract OutOfOrder {
    zz: Int;
    val: B;

    init() {
        self.zz = 99;
        self.val = B{ a: A{ x: 1 }, y: 2 };
    }
}