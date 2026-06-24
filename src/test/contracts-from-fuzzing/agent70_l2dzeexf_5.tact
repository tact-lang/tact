struct A {
    x: Int;
}

struct B {
    a: A;
}

struct C {
    b: B;
}

contract Test {
    deepNested: C;

    init() {
        self.deepNested = C{ b: B{ a: A{ x: 5 } } };
    }
}