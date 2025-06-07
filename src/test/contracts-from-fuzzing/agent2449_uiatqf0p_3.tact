struct DeepNested {
    level1: Int;
    level2: InnerLevel;
}

struct InnerLevel {
    fieldA: Int;
    fieldB: Bool;
    level3: DeepestLevel;
}

struct DeepestLevel {
    deepField: String;
    optionalDeepInt: Int?;
}

contract DeepStorage {
    deep: DeepNested;

    init() {
        self.deep = DeepNested{
            level1: 1,
            level2: InnerLevel{
                fieldA: 2,
                fieldB: true,
                level3: DeepestLevel{
                    deepField: "deep",
                    optionalDeepInt: null
                }
            }
        };
    }
}