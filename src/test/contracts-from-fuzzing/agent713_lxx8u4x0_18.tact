struct Tiny1 { a: Int; }
struct Tiny2 { b: Int; }
struct Tiny3 { c: Int; }

contract MultipleSmallStructs {
    f1: Tiny1;
    f2: Tiny2;
    f3: Tiny3;

    init() {
        self.f1 = Tiny1{ a: 1 };
        self.f2 = Tiny2{ b: 2 };
        self.f3 = Tiny3{ c: 3 };
    }
}