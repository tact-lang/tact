struct DeepNested {
    level: Int;
    child: InnerStruct;
}

struct InnerStruct {
    flag: Bool;
    value: Int?;
}

contract DeepNestedContract {
    item: DeepNested;

    init() {
        self.item = DeepNested{
            level: 5,
            child: InnerStruct{
                flag: false,
                value: null,
            },
        };
    }
}