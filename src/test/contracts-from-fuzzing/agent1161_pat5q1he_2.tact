struct NestedOptional {
    foo: Int?;
    bar: Bool;
}

contract DeepOptional {
    storage: NestedOptional;

    init() {
        self.storage = NestedOptional{ foo: null, bar: true };
    }
}