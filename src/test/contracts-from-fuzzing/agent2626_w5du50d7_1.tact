struct NestedLevel3 {
    deepVal: Int = 999;
}

struct NestedLevel2 {
    midVal: Int = 500;
    deeper: NestedLevel3;
}

struct NestedLevel1 {
    shallowVal: Int = 100;
    nested: NestedLevel2;
}

contract DeepNestTest {
    value: NestedLevel1;

    init() {
        self.value = NestedLevel1{
            shallowVal: 123,
            nested: NestedLevel2{
                midVal: 456,
                deeper: NestedLevel3{
                    deepVal: 789
                }
            }
        };
    }
}