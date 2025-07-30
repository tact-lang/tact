struct A {
    x: Int;
}

struct B {
    y: Bool;
}

struct C {
    z: String;
}

contract MultipleStructFields {
    a: A;
    b: B;
    c: C;

    init() {
        self.a = A{ x: 1 };
        self.b = B{ y: false };
        self.c = C{ z: "hi" };
    }
}
