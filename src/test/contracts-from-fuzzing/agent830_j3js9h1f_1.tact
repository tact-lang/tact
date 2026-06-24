struct DeepNested {
    level: Int;
    inner: InnerStruct;
}

struct InnerStruct {
    foo: Int;
    bar: Bool;
}

contract TestContract {
    data: DeepNested;

    init() {
        self.data = DeepNested{
            level: 1,
            inner: InnerStruct{
                foo: 42,
                bar: true
            }
        };
    }
}