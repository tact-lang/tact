struct DeepNested {
    fieldA: Int;
    nested: NestedLevel;
}

struct NestedLevel {
    fieldB: Bool;
    innerMost: InnerMost;
}

struct InnerMost {
    value: String;
}

contract TestContract {
    deep: DeepNested;
    
    init() {
        self.deep = DeepNested{
            fieldA: 1,
            nested: NestedLevel{
                fieldB: false,
                innerMost: InnerMost{
                    value: "abc"
                }
            }
        };
    }
}