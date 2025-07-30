struct OptionalDeep {
    inner: Inner?;
}

struct Inner {
    nested: Nested?;
}

struct Nested {
    x: Int?;
}

contract DeepOptionals {
    val: OptionalDeep;
    init() {
        self.val = OptionalDeep{ inner: null };
    }
}