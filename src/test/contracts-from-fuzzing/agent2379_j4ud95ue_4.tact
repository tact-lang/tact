struct A {
    val: Int;
}

struct B {
    a: A;
    b: Bool;
}

struct C {
    b1: B;
    b2: B;
}

contract Test {
    data: C;

    init() {
        self.data = C{
            b1: B{ a: A{val: 1}, b: true },
            b2: B{ a: A{val: 2}, b: false },
        };
    }
}