struct DeepNestLevel3 {
    x: Int;
}

struct DeepNestLevel2 {
    level3: DeepNestLevel3;
    y: Bool;
}

struct DeepNestLevel1 {
    level2: DeepNestLevel2;
    z: String;
}

contract DeepNestedStructTest {
    field: DeepNestLevel1;

    init() {
        self.field = DeepNestLevel1{
            level2: DeepNestLevel2{
                level3: DeepNestLevel3{
                    x: 42
                },
                y: true
            },
            z: "deep"
        };
    }
}