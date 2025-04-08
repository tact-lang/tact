struct A {
    a: Int;
}

struct B {
    b: Int;
}

struct C {
    c: Int;
}

contract WideVars {
    a: A;
    b: B;
    c: C;

    init() {
        self.a = A{a:1};
        self.b = B{b:2};
        self.c = C{c:3};
    }
}