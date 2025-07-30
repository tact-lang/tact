struct In1 { a: Int; }
struct In2 { b: Int; }
struct In3 { c: Int; }
struct In4 { d: Int; }
struct In5 { e: Int; }

contract LotsOfStructs {
    f1: In1;
    f2: In2;
    f3: In3;
    f4: In4;
    f5: In5;

    init() {
        self.f1 = In1{ a: 1 };
        self.f2 = In2{ b: 2 };
        self.f3 = In3{ c: 3 };
        self.f4 = In4{ d: 4 };
        self.f5 = In5{ e: 5 };
    }
}
