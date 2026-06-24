struct DeepNested {
    inner: InnerLevel;
}

struct InnerLevel {
    value: Int;
    optionalInner: InnerMost?;
}

struct InnerMost {
    flag: Bool;
    text: String;
}

contract TestContract {
    storage: DeepNested;

    init() {
        self.storage = DeepNested{
            inner: InnerLevel{
                value: 1,
                optionalInner: InnerMost{
                    flag: true,
                    text: "Hello"
                }
            }
        };
    }
}