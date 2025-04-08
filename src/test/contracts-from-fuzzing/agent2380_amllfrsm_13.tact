// contract with deeply nested multiple optional branches
struct A {
    x: Int?;
    y: Int;
}

struct B {
    a: A?;
    b: Int?;
}

struct C {
    b1: B?;
    b2: B?;
}

contract TestContract {
    c: C;
    init() {
        self.c = C{ b1: null, b2: null };
    }
}