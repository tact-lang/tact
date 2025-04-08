struct DeepNested {
    x: Int;
    y: Bool;
}

struct MiddleNested {
    inner: DeepNested;
    str: String;
}

contract DeeplyNestedContract {
    data: MiddleNested;

    init() {
        self.data = MiddleNested{
            inner: DeepNested{
                x: 42,
                y: true,
            },
            str: "hello",
        };
    }
}