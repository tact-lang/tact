struct A {
    a1: Int;
    a2: Bool;
}

struct B {
    b1: Int;
    innerA: A;
}

struct C {
    optB: B?;
    c1: Int;
}

contract Test3 {
    val: C;

    init() {
        self.val = C{ optB: null, c1: 10 };
    }
}
