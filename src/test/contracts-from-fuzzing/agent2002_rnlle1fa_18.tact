struct A {
    b: B;
}

struct B {
    c: C;
}

struct C {
    d: D;
}

struct D {
    e: E;
}

struct E {
    x: Int;
}

contract Deeper {
    nest: A;

    init() {
        self.nest = A{ b: B{ c: C{ d: D{ e: E{ x:42 }}}}};
    }
}
