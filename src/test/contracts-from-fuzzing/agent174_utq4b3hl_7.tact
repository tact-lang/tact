struct NestedD { d: Bool; }
struct NestedC { c: NestedD; }
struct NestedB { b: NestedC; }
struct NestedA { a: NestedB; }

contract DeepDeep {
    data: NestedA;

    init() {
        self.data = NestedA{ a: NestedB{ b: NestedC{ c: NestedD{ d: true } } } };
    }
}