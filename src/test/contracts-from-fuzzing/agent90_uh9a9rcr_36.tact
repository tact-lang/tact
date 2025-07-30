struct NestedOptionals {
    s: Outer?;
}

struct Outer {
    inner: Inner?;
}

struct Inner {
    x: Int?;
    y: Bool?;
}

contract NestedOptionalLayers {
    data: NestedOptionals;
    init() {
        self.data = NestedOptionals{ s: null };
    }
}