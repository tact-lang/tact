struct DeepInner {
    value1: Int;
    value2: Bool;
    note: String;
}

struct InnerOptional {
    deep: DeepInner?;
    message: String;
}

struct OuterStruct {
    id: Int;
    info: InnerOptional;
}

contract NestedOptionals {
    record: OuterStruct;

    init() {
        self.record = OuterStruct{
            id: 7,
            info: InnerOptional{
                deep: null,
                message: "test"
            }
        };
    }
}