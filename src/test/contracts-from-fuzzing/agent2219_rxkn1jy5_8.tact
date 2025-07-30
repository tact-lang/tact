struct NestedA { x: Int; }
struct NestedB { b: Bool; nestedA: NestedA; }

contract NestedReferences {
    data: NestedB;

    init() {
        self.data = NestedB{ b: false, nestedA: NestedA{ x: 123 } };
    }
}