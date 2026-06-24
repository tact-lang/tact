// Mix of optionals and defaults in nested struct fields
struct Inner {
    k: Int? = null;
    m: Bool = false;
}

struct Outer {
    nested: Inner?;
}

contract MixedNestedOptionalWithDefaults {
    field: Outer;

    init() {
        self.field = Outer{ nested: null };
    }
}