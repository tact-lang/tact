struct S1 { a: Int }
struct S2 { b: Bool }

contract MultipleStructs {
    x: S1;
    y: S2;
    init() {
        self.x = S1{ a: 12 };
        self.y = S2{ b: false };
    }
}
