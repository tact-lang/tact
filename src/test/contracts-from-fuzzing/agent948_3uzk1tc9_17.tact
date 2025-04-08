struct A { val: Int; }
struct B { val: Int; }
struct C { val: Int; }
struct D { val: Int; }
struct E { val: Int; }

contract ManyStructs {
    a: A;
    b: B;
    c: C;
    d: D;
    e: E;

    init() {
        self.a = A{ val: 1 };
        self.b = B{ val: 2 };
        self.c = C{ val: 3 };
        self.d = D{ val: 4 };
        self.e = E{ val: 5 };
    }
}