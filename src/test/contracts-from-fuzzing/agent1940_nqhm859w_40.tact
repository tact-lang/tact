struct InnerInner {
    a: Int;
    b: Bool;
}

struct Inner {
    s: InnerInner;
}

contract DeepNestedStruct {
    storage: Inner;
    init() {
        self.storage = Inner{
            s: InnerInner{ a: 5, b: true }
        };
    }
}