struct C1 { a: Int; }
struct C2 { a: Int?; }
struct C3 { a: String; }
struct C4 { a: Bool; }

contract MixedStructs {
    f1: C1;
    f2: C2;
    f3: C3;
    f4: C4;

    init() {
        self.f1 = C1{ a: 1 };
        self.f2 = C2{ a: null };
        self.f3 = C3{ a: "h" };
        self.f4 = C4{ a: true };
    }
}