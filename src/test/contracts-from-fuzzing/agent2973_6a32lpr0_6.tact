struct A {
    x: Int;
}

struct B {
    y: Int;
}

contract MultiStructs {
    a: A;
    b: B;

    init() {
        self.a = A{x: 7};
        self.b = B{y: 11};
    }
}