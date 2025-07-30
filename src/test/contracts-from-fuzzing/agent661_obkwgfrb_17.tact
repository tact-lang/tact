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
    val: Int;
}

contract DeepMany {
    root: A;
    init() {
        self.root = A{ b: B{ c: C{ d: D{ e: E{ val: 999 } } } } };
    }
}