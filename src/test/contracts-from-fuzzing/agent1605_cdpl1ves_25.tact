struct A {
    f: Bool;
}

struct B {
    g: Bool;
}

contract MultiStructs {
    a: A;
    b: B;

    init() {
        self.a = A{f: true};
        self.b = B{g: false};
    }
}