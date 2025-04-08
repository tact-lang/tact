struct A {
    x: Int;
    y: B;
}

struct B {
    z: C;
}

struct C {
    k: D;
}

struct D {
    n: E;
}

struct E {
    val: Int;
}

contract NestedChains {
    v: A;

    init() {
        self.v = A{ x:1, y:B{z:C{k:D{n:E{val:123}}}} };
    }
}