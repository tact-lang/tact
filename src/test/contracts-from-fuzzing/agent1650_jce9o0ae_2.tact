struct DeepNested {
    nested: Nested;
}

struct Nested {
    inner: Inner;
}

struct Inner {
    x: Int;
    y: Bool;
}

contract DeepStore {
    field: DeepNested;

    init() {
        self.field = DeepNested {
            nested: Nested {
                inner: Inner { x: 5, y: true }
            }
        };
    }
}