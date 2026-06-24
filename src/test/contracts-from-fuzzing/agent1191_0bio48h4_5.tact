struct DeepNested {
    inner: Middle;
}

struct Middle {
    nested: InnerMost;
}

struct InnerMost {
    val: Int;
    another: Bool;
}

contract NestedStructInStorage {
    data: DeepNested;

    init() {
        self.data = DeepNested{
            inner: Middle{
                nested: InnerMost{
                    val: 7,
                    another: true
                }
            }
        };
    }
}