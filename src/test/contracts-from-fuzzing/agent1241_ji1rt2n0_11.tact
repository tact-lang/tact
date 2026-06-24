struct NestedA { b: Int; }
struct NestedB { c: Bool; d: Int; }
struct NestedC { e: NestedA; f: NestedB; g: Bool; h: Int; }

contract TestComplex {
    superNested: NestedC;

    init() {
        self.superNested = NestedC{
            e: NestedA{ b: 1 },
            f: NestedB{ c: true, d: 2 },
            g: false,
            h: 777
        };
    }
}
