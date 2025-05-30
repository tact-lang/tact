struct NestedStructLevel3 {
    val3: Int;
}

struct NestedStructLevel2 {
    val2: NestedStructLevel3;
}

struct NestedStructLevel1 {
    val1: NestedStructLevel2;
}

contract DeepNestTest {
    testField: NestedStructLevel1;

    init() {
        self.testField = NestedStructLevel1{
            val1: NestedStructLevel2{
                val2: NestedStructLevel3{
                    val3: 123
                }
            }
        };
    }
}