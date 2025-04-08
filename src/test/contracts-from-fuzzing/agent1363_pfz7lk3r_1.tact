struct DeepNested {
    inner: InnerStruct;
}

struct InnerStruct {
    sub: SubStruct;
}

struct SubStruct {
    subfield: Int;
}

contract TestContract {
    data: DeepNested;

    init() {
        self.data = DeepNested{
            inner: InnerStruct{
                sub: SubStruct{
                    subfield: 42,
                },
            },
        };
    }
}