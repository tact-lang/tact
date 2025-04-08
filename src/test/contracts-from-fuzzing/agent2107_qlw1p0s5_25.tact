struct A { a: Int }
struct B { b: Bool? }
struct C { c: String }

contract ComboChain {
    f1: A;
    f2: B;
    f3: C;
    f4: Int;
    f5: Bool?;
    f6: String;
    f7: Int?;

    init() {
        self.f1 = A{ a: 1 };
        self.f2 = B{ b: null };
        self.f3 = C{ c: "s" };
        self.f4 = 42;
        self.f5 = null;
        self.f6 = "t";
        self.f7 = null;
    }
}