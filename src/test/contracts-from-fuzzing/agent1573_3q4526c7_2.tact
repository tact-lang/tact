struct DeepNested {
    value: Int;
}

struct MiddleNested {
    inner: DeepNested;
}

struct OuterNested {
    middle: MiddleNested;
}

contract TestContract {
    nested: OuterNested;

    init() {
        self.nested = OuterNested{
            middle: MiddleNested{
                inner: DeepNested{
                    value: 42
                }
            }
        };
    }
}