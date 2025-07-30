struct A { i: Int }
struct B { j: Int? }
struct C { k: Int }
struct D { l: Int? }

contract TestContract {
    a: A;
    b: B;
    c: C;
    d: D;

    init() {
        self.a = A { i: 1 };
        self.b = B { j: null };
        self.c = C { k: 3 };
        self.d = D { l: 4 };
    }
}