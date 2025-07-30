struct A {
    a: Int;
}

struct B {
    b: Int;
}

struct Combined {
    s1: A;
    s2: B;
    num: Int;
}

contract TestContract {
    combined: Combined;

    init() {
        self.combined = Combined{
            s1: A{a: 1},
            s2: B{b: 2},
            num: 42,
        };
    }
}