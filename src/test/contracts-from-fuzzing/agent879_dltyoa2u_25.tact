struct NestedA { a: Int; }
struct NestedB { b: NestedA; }
struct NestedC { c: NestedB; }

contract DeepChain {
    s: NestedC;
    init() {
        self.s = NestedC{ c: NestedB{ b: NestedA{ a: 123 } } };
    }
}
