struct DeepNested {
    inner: NestedLevel;
}

struct NestedLevel {
    num: Int;
    flag: Bool;
    optInt: Int?;
    innerMost: InnerMost;
}

struct InnerMost {
    val: Int;
    valid: Bool;
}

contract TestContract {
    data: DeepNested;

    init() {
        self.data = DeepNested{
            inner: NestedLevel{
                num: 1,
                flag: true,
                optInt: null,
                innerMost: InnerMost{
                    val: 42,
                    valid: false,
                }
            }
        };
    }
}