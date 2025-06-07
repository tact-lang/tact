struct NestedA { b: Int; }
struct NestedB { c: Int; }
struct Container { a: NestedA; d: NestedB; e: Int; }

contract Complex {
    val: Container;

    init() {
        self.val = Container{
            a: NestedA{ b: 1 },
            d: NestedB{ c: 2 },
            e: 3,
        };
    }
}