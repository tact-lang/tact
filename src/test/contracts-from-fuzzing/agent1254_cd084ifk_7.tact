struct A {
    val: Int;
}

struct B {
    aval: A;
}

contract TopLevel {
    a: A;
    b: B;

    init() {
        self.a = A{ val: 1 };
        self.b = B{ aval: self.a };
    }
}