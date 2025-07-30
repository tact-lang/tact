struct A { v: Int }

struct B { v: Int }

struct C { v: Int }

struct D { v: Int }

struct E { v: Int }

contract ManyStructFields {
    a: A;
    b: B;
    c: C;
    d: D;
    e: E;
    
    init() {
        self.a = A{v:1};
        self.b = B{v:2};
        self.c = C{v:3};
        self.d = D{v:4};
        self.e = E{v:5};
    }
}