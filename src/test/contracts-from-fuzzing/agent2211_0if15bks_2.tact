struct DeepNestLevel3 {
    x: Int;
    y: Bool;
}

struct DeepNestLevel2 {
    level3: DeepNestLevel3;
    flag: Bool;
}

struct DeepNestLevel1 {
    level2: DeepNestLevel2;
    counter: Int;
}

contract NestedStructContract {
    deepField: DeepNestLevel1;

    init() {
        self.deepField = DeepNestLevel1{
            level2: DeepNestLevel2{
                level3: DeepNestLevel3{
                    x: 1,
                    y: true,
                },
                flag: false,
            },
            counter: 42,
        };
    }
}