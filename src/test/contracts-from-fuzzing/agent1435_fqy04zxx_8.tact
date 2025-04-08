struct SubA { value: Int; }
struct SubB { a: SubA; }
struct SubC { b: SubB; }

contract DeepNest {
    nested: SubC;

    init() {
        self.nested = SubC{ b: SubB{ a: SubA{ value: 123 } } };
    }
}