struct DeepNested {
    inner: InnerStruct;
}

struct InnerStruct {
    foo: Int;
    bar: InnerMost;
}

struct InnerMost {
    x: Int;
    y: Bool;
}

contract TestContract {
    state: DeepNested;
    
    init() {
        self.state = DeepNested{
            inner: InnerStruct{
                foo: 42,
                bar: InnerMost{
                    x: 1,
                    y: true,
                },
            },
        };
    }
}