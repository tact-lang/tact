struct S1 { a: Int }
struct S2 { b: Int }

contract ManyStructs {
    f1: S1;
    f2: S2;
    x: Int;

    init() {
        self.f1 = S1{ a: 1 };
        self.f2 = S2{ b: 2 };
        self.x = 3;
    }
}