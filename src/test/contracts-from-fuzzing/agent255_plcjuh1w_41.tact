struct S1 {
    a: Int;
}
struct S2 {
    b: Int;
}

contract FieldsOrder {
    f2: S2;
    f1: S1;

    init() {
        self.f1 = S1{ a: 1 };
        self.f2 = S2{ b: 2 };
    }
}