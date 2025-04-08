struct A {
    a: Int;
}

struct B {
    b: Int;
}

struct C {
    c: Int;
}

contract TestContract {
    aa: A;
    bb: B;
    cc: C;
    init() {
        self.aa = A{a:1};
        self.bb = B{b:2};
        self.cc = C{c:3};
    }
}