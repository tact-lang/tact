struct DeepNested {
    inner1: Int;
    inner2: Bool?;
}

struct NestedLevel2 {
    nested: DeepNested;
    optString: String?;
}

contract NestedStructFields {
    data: NestedLevel2;
    
    init() {
        self.data = NestedLevel2{
            nested: DeepNested{
                inner1: 42,
                inner2: null,
            },
            optString: "hi",
        };
    }
}