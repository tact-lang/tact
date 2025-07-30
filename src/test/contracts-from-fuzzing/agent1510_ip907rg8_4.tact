contract OptionalDeep {
    nestedOptional: Nested?;

    init() {
        self.nestedOptional = null;
    }
}

struct Nested {
    inner: Inner?;
}

struct Inner {
    s: String?;
    val: Int?;
}
