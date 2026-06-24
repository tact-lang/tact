struct A {
    b: B;
    num: Int;
}

struct B {
    c: C;
    val: Bool;
}

struct C {
    flag: Bool;
}

contract TripleNested {
    data: A;

    init() {
        self.data = A{ b: B{ c: C{ flag: true }, val: false }, num: 7 };
    }

    receive() {
        self.data = A{ b: B{ c: C{ flag: false }, val: true }, num: 9 };
    }
}