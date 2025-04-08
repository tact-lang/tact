struct A {
    val: Int;
}

struct B {
    val: Int;
}

struct C {
    a: A;
    b: B;
}

contract StructsWithStructs {
    a: A;
    b: B;
    c: C;

    init() {
        self.a = A{ val: 1 };
        self.b = B{ val: 2 };
        self.c = C{ a: self.a, b: self.b };
    }
}