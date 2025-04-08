struct DeepOptional {
    a: Int?;
    b: Bool?;
    s: String?;
}

struct NestedOptional {
    inner: DeepOptional?;
}

contract TestContract {
    nested: NestedOptional;
    init() {
        self.nested = NestedOptional{ inner: null };
    }
}