struct A {
    foo: Int;
}

struct B {
    bar: Bool;
}

contract HeteroStructs {
    f1: A;
    f2: B;

    init() {
        self.f1 = A{ foo: 123 };
        self.f2 = B{ bar: true };
    }
}