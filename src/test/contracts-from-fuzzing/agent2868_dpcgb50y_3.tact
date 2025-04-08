struct DeepNested {
    level2: Nested;
}

struct Nested {
    x: Int;
    y: Bool?;
}

contract DeepNestedStorage {
    deep: DeepNested;
    
    init() {
        self.deep = DeepNested{ level2: Nested{ x: 10 } };
    }
}