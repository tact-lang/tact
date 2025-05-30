struct A {
    a: Int;
}
struct B {
    b: Int;
    a: A;
}
struct C {
    c: Int;
    b: B;
}

contract CrossOrder {
    data: C;
    init() {
        self.data = C{c:1, b: B{b:2, a: A{a:3}}};
    }
}