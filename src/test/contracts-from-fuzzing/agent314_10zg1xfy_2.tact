struct DeepNested {
    val1: Int;
    val2: Bool;
    optionalInner: Int?;
}

struct NestedLevel {
    nested: DeepNested;
    text: String;
}

contract StructInStructStorage {
    sfield: NestedLevel;
    
    init() {
        self.sfield = NestedLevel{
            nested: DeepNested{
                val1: 1,
                val2: true,
                optionalInner: null,
            },
            text: "Hello"
        };
    }
}