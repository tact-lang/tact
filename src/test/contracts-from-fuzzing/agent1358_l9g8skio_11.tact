struct A { a: Int; }
struct B { b: Bool; }
struct C { c: String; }

contract MultiStructs {
    f1: A;
    f2: B;
    f3: C;

    init() {
        self.f1 = A { a: 1 };
        self.f2 = B { b: true };
        self.f3 = C { c: "hi" };
    }
}