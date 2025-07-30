struct S1 { a: Int }
struct S2 { b: S1? }

contract OptionalNested {
    field: S2;

    init() {
        self.field = S2{ b: S1{ a: 7 } };
    }
}