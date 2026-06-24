struct NestedDefault {
    inner: InnerNested;
}

struct InnerNested {
    value: Int = 100;
}

contract NestedDefaults {
    data: NestedDefault;

    init() {
        self.data = NestedDefault{
            inner: InnerNested{}
        };
    }
}