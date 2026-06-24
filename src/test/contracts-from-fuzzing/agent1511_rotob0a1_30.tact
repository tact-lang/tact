struct A {
    x: Int;
}

struct B {
    x: Int;
    inner: A;
}

struct C {
    n: Int;
    m: String;
}

contract ManyStructs {
    a: A;
    b: B;
    c: C;

    init() {
        self.a = A{ x: 1 };
        self.b = B{ x: 2, inner: A{ x: 3 } };
        self.c = C{ n: 4, m: "hi" };
    }
}
