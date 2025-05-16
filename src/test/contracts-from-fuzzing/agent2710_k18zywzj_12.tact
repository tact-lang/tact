struct DeepOptional {
    nested: Inner?;
}

struct Inner {
    foo: Int?;
    bar: Bool?;
}

contract NestedOptionalStruct {
    store: DeepOptional;

    init() {
        self.store = DeepOptional{ nested: null };
    }
}