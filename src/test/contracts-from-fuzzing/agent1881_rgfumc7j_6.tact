struct DeepA { b: Int; }
struct DeepB { a: DeepA; }
struct DeepC { b: DeepB; }
struct DeepD { c: DeepC; }

contract DeepNestTest {
    field: DeepD;

    init() {
        self.field = DeepD{ c: DeepC{ b: DeepB{ a: DeepA{ b: 123 } } } };
    }
}