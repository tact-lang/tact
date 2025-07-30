struct DeepNested {
    inner: MidNested;
}

struct MidNested {
    inner: InnerMost;
}

struct InnerMost {
    value: Int;
    flag: Bool?;
}

contract TestContract {
    data: DeepNested;

    init() {
        self.data = DeepNested{
            inner: MidNested{
                inner: InnerMost{
                    value: 123,
                    flag: null,
                },
            },
        };
    }
}
