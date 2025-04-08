struct C {
    a: Int;
}

struct B {
    c: C;
}

struct A {
    b: B;
}

contract DeepChain {
    val: A;

    init() {
        self.val = A{ b: B{ c: C{ a: 1 } } };
    }
}