struct NestedLevel3 {
    val: Int;
}

struct NestedLevel2 {
    val: Int;
    nested3: NestedLevel3;
}

struct NestedLevel1 {
    val: Int;
    nested2: NestedLevel2;
}

contract DeepNestTest {
    deepField: NestedLevel1;

    init() {
        self.deepField = NestedLevel1{
            val: 1,
            nested2: NestedLevel2{
                val: 2,
                nested3: NestedLevel3{
                    val: 3,
                }
            }
        };
    }
}
