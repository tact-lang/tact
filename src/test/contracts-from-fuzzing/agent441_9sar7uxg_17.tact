struct NestedA {
    foo: Int;
}

struct NestedB {
    foo: Int;
}

struct Outer {
    a: NestedA;
    b: NestedB;
}

contract TestContract {
    storage: Outer;

    init() {
        self.storage = Outer{
            a: NestedA{ foo: 1 },
            b: NestedB{ foo: 2 },
        };
    }
}