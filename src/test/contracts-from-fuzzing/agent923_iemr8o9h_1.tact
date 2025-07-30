struct InnerMost {
    a: Int = 1;
    b: Int?;
}

struct Inner {
    x: Bool = true;
    y: InnerMost;
}

contract DeepNestedStruct {
    data: Inner;

    init() {
        self.data = Inner{
            y: InnerMost{
                a: 5,
                b: null,
            },
        };
    }
}