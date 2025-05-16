struct NestedStr {
    id: Int;
    innerStr: InnerStr;
}

struct InnerStr {
    text: String;
    flag: Bool?;
}

contract StructInStruct {
    value: NestedStr;

    init() {
        self.value = NestedStr{
            id: 1,
            innerStr: InnerStr{
               text: "Cool",
               flag: null,
            },
        };
    }
}