struct A { u: Int; }
struct B { v: Bool; }
struct C { w: String?; }

contract TestContract {
    a: A;
    b: B;
    c: C;
    init() {
        self.a = A{ u: 1 };
        self.b = B{ v: true };
        self.c = C{ w: null };
    }
}