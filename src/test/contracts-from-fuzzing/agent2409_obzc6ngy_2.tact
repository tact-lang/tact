struct DeepNestLevel2 {
    val2: Int;
}

struct DeepNestLevel1 {
    level2: DeepNestLevel2;
}

contract DeepNestedStructField {
    level1: DeepNestLevel1;

    init() {
        self.level1 = DeepNestLevel1{ level2: DeepNestLevel2{ val2: 999 } };
    }
}