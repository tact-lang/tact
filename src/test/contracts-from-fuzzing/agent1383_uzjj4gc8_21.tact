struct A { p: Int; }
struct B { q: Int; }

contract MultiStructs {
    s1: A;
    s2: B;

    init() {
        self.s1 = A{p: 1};
        self.s2 = B{q: 2};
    }
}