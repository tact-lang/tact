struct NestedLevel3 {
    val3: Int;
}

struct NestedLevel2 {
    val2: NestedLevel3;
}

struct NestedLevel1 {
    val1: NestedLevel2;
}

contract DeepNestedTest {
    deepField: NestedLevel1;

    init() {
        self.deepField = NestedLevel1{
            val1: NestedLevel2{
                val2: NestedLevel3{
                    val3: 123
                }
            }
        };
    }
}
