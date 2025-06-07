struct Base {
    a: Int;
    b: Bool;
}

struct NestedMultiple {
    one: Base;
    two: Base;
}

contract MultiNested {
    all: NestedMultiple;

    init() {
        self.all = NestedMultiple{
            one: Base{ a: 1, b: true },
            two: Base{ a: 2, b: false },
        };
    }
}