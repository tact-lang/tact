struct Nested {
    inner: AnotherInner;
}

struct AnotherInner {
    deep: DeepInner;
}

struct DeepInner {
    value: Int;
}

contract DeepNesting {
    store: Nested;

    init() {
        self.store = Nested{
            inner: AnotherInner{
                deep: DeepInner{
                    value: 42
                }
            }
        };
    }
}