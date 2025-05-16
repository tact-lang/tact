struct NestedLevel1 {
    val1: Int;
    nested: NestedLevel2;
}

struct NestedLevel2 {
    val2: Bool;
    deeplyNested: NestedLevel3;
}

struct NestedLevel3 {
    val3: String;
    optVal: Int?;
}

contract DeepNestTest {
    data: NestedLevel1;

    init() {
        self.data = NestedLevel1{
            val1: 10,
            nested: NestedLevel2{
                val2: true,
                deeplyNested: NestedLevel3{
                    val3: "test",
                    optVal: null
                }
            }
        };
    }
}