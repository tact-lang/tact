struct DeepNestOptional {
    inner: Inner?;
}

struct Inner {
    val: InnerInner;
}

struct InnerInner {
    val: Int;
}

contract OptionalInNestedStruct {
    data: DeepNestOptional;

    init() {
        self.data = DeepNestOptional{
            inner: null,
        };
    }
}
