struct DeepNested {
    flag: Bool;
    inner: InnerStruct;
}

struct InnerStruct {
    value: Int;
    opt: Int?;
}

contract TestContract {
    deep: DeepNested;

    init() {
        self.deep = DeepNested{
            flag: true,
            inner: InnerStruct{
                value: 123,
                opt: null
            }
        };
    }
}