struct DeepNested {
    nested1: String;
    nested2: Int;
    nested3: NestedStruct;
}

struct NestedStruct {
    flag: Bool;
    message: String;
}

contract TestDeepNested {
    item: DeepNested;

    init() {
        self.item = DeepNested{
            nested1: "abc",
            nested2: 1234,
            nested3: NestedStruct{
                flag: true,
                message: "nested",
            },
        };
    }
}
