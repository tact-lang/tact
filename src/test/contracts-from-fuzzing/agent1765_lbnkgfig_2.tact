struct NestedLevel3 {
    val3: Int;
    opt3: Int?;
}

struct NestedLevel2 {
    val2: Int;
    nested3: NestedLevel3;
    optNested3: NestedLevel3?;
}

struct NestedLevel1 {
    val1: Int;
    nested2: NestedLevel2;
    optNested2: NestedLevel2?;
}

contract DeepNestTester {
    deeplyNested: NestedLevel1;

    init() {
        self.deeplyNested = NestedLevel1{
            val1: 10,
            nested2: NestedLevel2{
                val2: 20,
                nested3: NestedLevel3{ val3: 30, opt3: null },
                optNested3: null
            },
            optNested2: null
        };
    }
}