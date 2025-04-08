struct A {
    a: Int;
}

struct B {
    b: Int;
}

struct C {
    c: Int;
}

contract StructArray {
    x: A;
    y: B;
    z: C;

    init() {
        self.x = A{a:1};
        self.y = B{b:2};
        self.z = C{c:3};
    }
}