struct A {
    f: Int;
}

struct B {
    f: Int;
    nested: A;
}

struct C {
    f: Int;
    nested: B;
}

contract TestContract {
    a: A;
    b: B;
    c: C;
    init() {
        self.a = A{f:1};
        self.b = B{f:2,nested:A{f:3}};
        self.c = C{f:4,nested:B{f:5,nested:A{f:6}}};
    }
}
