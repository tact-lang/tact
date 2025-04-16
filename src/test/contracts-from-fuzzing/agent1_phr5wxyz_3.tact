struct DeepNested {
    inner: Inner;
}

struct Inner {
    tiny: Tiny;
}

struct Tiny {
    value: Int?;
}

contract DeeplyNestedField {
    d: DeepNested;

    init() {
        self.d = DeepNested{
            inner: Inner{
                tiny: Tiny{ value: null }
            }
        };
    }
}
