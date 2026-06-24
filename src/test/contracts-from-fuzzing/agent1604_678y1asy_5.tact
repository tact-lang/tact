struct DeeplyNestedLevel3 {
    z: Int;
}

struct DeeplyNestedLevel2 {
    y: DeeplyNestedLevel3;
}

struct DeeplyNestedLevel1 {
    x: DeeplyNestedLevel2;
}

contract DeepNestingTest {
    nested: DeeplyNestedLevel1;

    init() {
        self.nested = DeeplyNestedLevel1{
            x: DeeplyNestedLevel2{
                y: DeeplyNestedLevel3{
                    z: 123
                }
            }
        };
    }
}