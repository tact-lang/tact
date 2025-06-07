contract NestedOptionalsAndStructs {
    flag: Bool?;
    nested: Nested?;

    init() {
        self.flag = null;
        self.nested = null;
    }
}

struct Nested {
    subflag: Bool?;
    text: String?;
}
