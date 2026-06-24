struct A {
    x: Int;
}

struct B {
    a: A;
}

struct C {
    b: B;
}

contract VeryDeepNested {
    store: C;

    init() {
        self.store = C{ b: B{ a: A{ x: 777 } } };
    }
}