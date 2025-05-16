struct A { a: Int; }
struct B { b: Int; }
struct C { c: Int; }
struct D { d: Int; }
struct E { e: Int; }

contract Test {
    a: A;
    b: B;
    c: C;
    d: D;
    e: E;

    init() {
        self.a = A{a:1};
        self.b = B{b:2};
        self.c = C{c:3};
        self.d = D{d:4};
        self.e = E{e:5};
    }
}