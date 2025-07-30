struct DeepNested {
    field1: Int;
    field2: Bool;
    inner: InnerStruct;
}

struct InnerStruct {
    innermost: InnermostStruct;
    flag: Bool;
}

struct InnermostStruct {
    value: Int;
}

contract TestContract {
    deepField: DeepNested;

    init() {
        self.deepField = DeepNested{
            field1: 123,
            field2: true,
            inner: InnerStruct{
                innermost: InnermostStruct{value: 5},
                flag: false,
            },
        };
    }
}
