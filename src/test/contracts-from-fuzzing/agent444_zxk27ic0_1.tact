struct InnerMost {
    value: Int;
}

struct Inner {
    innerMost: InnerMost;
    flag: Bool;
}

contract DeepNestedTest {
    nestedStruct: Inner;

    init() {
        self.nestedStruct = Inner{
            innerMost: InnerMost{ value: 123 },
            flag: true
        };
    }
}