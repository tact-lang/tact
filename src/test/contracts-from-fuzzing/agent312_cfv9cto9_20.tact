struct A { a: Int; }
struct B { b: Bool; }
struct C { c: String; }

contract TestContract {
    aa: A;
    bb: B;
    cc: C;
    init() {
        self.aa = A{ a: 1 };
        self.bb = B{ b: true };
        self.cc = C{ c: "X" };
    }
}