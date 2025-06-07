struct NestedNested {
    a: Int;
}

struct Nested {
    x: Int;
    y: NestedNested;
}

contract TestContract {
    data: Nested;

    init() {
        self.data = Nested{ x: 1, y: NestedNested{ a: 2 } };
    }
}