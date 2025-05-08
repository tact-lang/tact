struct DeepNested {
    inner: Inner;
}

struct Inner {
    field: String;
}

contract DeepNestedField {
    d: DeepNested;

    init() {
        self.d = DeepNested{inner: Inner{field: "deep"}};
    }
}