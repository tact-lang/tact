struct DeepNested {
    level: Int;
    inner: InnerStruct;
}

struct InnerStruct {
    flag: Bool;
    optValue: Int?;
}

contract TestContract {
    data: DeepNested;
    init() {
        self.data = DeepNested{
            level: 1,
            inner: InnerStruct{
                flag: true,
                optValue: null,
            },
        };
    }
}
