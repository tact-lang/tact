struct A { val: Int; }
struct B { val: Int; }
struct C { val: Int; }

contract ManyStructs {
    a: A;
    b: B;
    c: C;
    init() {
        self.a = A{ val:1 };
        self.b = B{ val:2 };
        self.c = C{ val:3 };
    }
}