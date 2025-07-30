struct DeepNested {
    inner: NestedOptional;
}

struct NestedOptional {
    value: Int?;
}

contract TestContract {
    data: DeepNested;
    init() {
        self.data = DeepNested{
            inner: NestedOptional{ value: null }
        };
    }
}
