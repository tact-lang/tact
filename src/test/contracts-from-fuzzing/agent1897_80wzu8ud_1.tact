struct DeepNestedStruct {
    x: Int;
    y: Int;
    inner: InnerStruct;
}

struct InnerStruct {
    flag: Bool;
    maybeVal: Int?;
    core: CoreStruct;
}

struct CoreStruct {
    msg: String;
    value: Int?;
}

contract NestedContract {
    data: DeepNestedStruct;

    init() {
        self.data = DeepNestedStruct{
            x: 1,
            y: 2,
            inner: InnerStruct{
                flag: true,
                maybeVal: null,
                core: CoreStruct{
                    msg: "hi",
                    value: null,
                },
            }
        };
    }
}
