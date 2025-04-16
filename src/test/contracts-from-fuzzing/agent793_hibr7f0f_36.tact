struct A { a: Int }
struct B { b: Int }
struct C { c: Int }
struct D { d: Int }

contract LongFields {
    a:A; b:B; c:C; d:D;
    init() {
        self.a = A{a:1};
        self.b = B{b:2};
        self.c = C{c:3};
        self.d = D{d:4};
    }
}