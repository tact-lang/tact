struct A { a: Int }
struct B { b: Int }
struct C { c: Int }
struct D { d: Int }
struct E { e: Int }

contract ManyFields {
    f1: A;
    f2: B;
    f3: C;
    f4: D;
    f5: E;

    init() {
        self.f1 = A{a:1};
        self.f2 = B{b:2};
        self.f3 = C{c:3};
        self.f4 = D{d:4};
        self.f5 = E{e:5};
    }
}