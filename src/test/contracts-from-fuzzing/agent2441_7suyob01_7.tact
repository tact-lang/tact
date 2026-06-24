struct A {
    val: Int;
}

struct B {
    a: A;
}

struct C {
    b: B;
}

contract Chain {
    chain: C;

    init() {
        self.chain = C{ b: B{ a: A{ val: 1 } } };
    }
}