struct Flat1 { a: Int; }
struct Flat2 { b: Int; }

contract TwoStructs {
    f1: Flat1;
    f2: Flat2;

    init() {
        self.f1 = Flat1{ a: 1 };
        self.f2 = Flat2{ b: 2 };
    }
}