struct OneA { a: Int }
struct OneB { b: Bool }
struct OneC { c: String }

contract ManyNested {
    f1: OneA;
    f2: OneB;
    f3: OneC;

    init() {
        self.f1 = OneA{ a: 1 };
        self.f2 = OneB{ b: true };
        self.f3 = OneC{ c: "abc" };
    }
}