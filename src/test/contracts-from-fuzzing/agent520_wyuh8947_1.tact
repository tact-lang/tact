struct InnerMost {
    a: Int;
    b: Int?;
}

struct Inner {
    nested: InnerMost;
    flag: Bool;
}

contract DeepNestedContract {
    data: Inner;

    init() {
        self.data = Inner{
            nested: InnerMost{ a: 1, b: null },
            flag: true
        };
    }
}