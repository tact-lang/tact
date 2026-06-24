struct Nested {
    deepField: Int;
}

struct LevelTwo {
    nested: Nested;
    extraField: Bool;
}

contract DeepNestedContract {
    data: LevelTwo;
    
    init() {
        self.data = LevelTwo{
            nested: Nested{deepField: 42},
            extraField: true,
        };
    }
}