struct DeeplyNested {
    inner: InnerStruct;
}

struct InnerStruct {
    foo: Int;
    bar: Bool;
}

contract TestContract {
    data: DeeplyNested;
    init() {
        self.data = DeeplyNested{
            inner: InnerStruct{
                foo: 123,
                bar: true
            }
        };
    }
}