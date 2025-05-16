contract TestContract {
    nested: Nested;

    init() {
        self.nested = Nested{
            innerOpt: null,
        };
    }
}

struct Nested {
    innerOpt: DeepInner?;
}

struct DeepInner {
    x: Int?;
    y: String?;
}
