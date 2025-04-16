contract DeepOptional {
    inner: Inner?;

    init() {
        self.inner = null;
    }
}

struct Inner {
    nested: Nested?;
}

struct Nested {
    value: Int?;
}