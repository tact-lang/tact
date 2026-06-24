struct DeepNested {
    level1: NestedLevel1;
}

struct NestedLevel1 {
    level2: NestedLevel2;
}

struct NestedLevel2 {
    x: Int;
    y: Bool;
}

contract DeepContract {
    deepData: DeepNested;

    init() {
        self.deepData = DeepNested{
            level1: NestedLevel1{
                level2: NestedLevel2{ x: 42, y: false }
            }
        };
    }
}