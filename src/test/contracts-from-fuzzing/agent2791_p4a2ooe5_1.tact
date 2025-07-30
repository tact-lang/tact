struct DeepNested {
    inner: InnerLayer;
}

struct InnerLayer {
    deepInner: DeepestLayer;
}

struct DeepestLayer {
    flag: Bool;
    text: String;
    num: Int;
}

contract TestContract {
    nestedField: DeepNested;
    
    init() {
        self.nestedField = DeepNested{
            inner: InnerLayer{
                deepInner: DeepestLayer{
                    flag: true,
                    text: "hello",
                    num: 42,
                },
            },
        };
    }
}
