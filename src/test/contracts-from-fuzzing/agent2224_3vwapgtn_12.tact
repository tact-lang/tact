struct A {
    x: Int;
}
struct B {
    a: A;
}
struct C {
    b: B;
}

contract Test12 {
    ca: A;
    cb: B;
    cc: C;
    init() {
        self.ca = A{x:1};
        self.cb = B{a:A{x:2}};
        self.cc = C{b:B{a:A{x:3}}};
    }
}