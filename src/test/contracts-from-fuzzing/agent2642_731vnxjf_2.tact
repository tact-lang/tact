struct DeepNested {
    inner: Nested;
}

struct Nested {
    value: InnerMost;
}

struct InnerMost {
    x: Int;
    y: Int?;
}

contract Persist {
    data: DeepNested;
    init() {
        self.data = DeepNested{
            inner: Nested{
                value: InnerMost{ x: 10, y: null }
            }
        };
    }
}