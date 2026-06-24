struct A {
    val: Int;
}

struct B {
    a: A;
}

struct C {
    a: A;
    b: B;
}

contract MultipleStructRefs {
    storage: C;

    init() {
        self.storage = C{
            a: A{val: 1},
            b: B{a: A{val: 2}}
        };
    }
}