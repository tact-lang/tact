struct NestedA {
    a: Int;
}

struct NestedB {
    b: NestedA;
    c: Int?;
}

contract TestContract {
    foo: NestedB;

    init() {
        self.foo = NestedB{ b: NestedA{ a: 12 }, c: null };
    }
}