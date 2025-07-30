struct NestedLevel3 {
    val1: Int;
}

struct NestedLevel2 {
    val2: NestedLevel3;
}

struct NestedLevel1 {
    val3: NestedLevel2;
}

contract Deep3LevelNested {
    n3: NestedLevel1;
    init() {
        self.n3 = NestedLevel1 {
            val3: NestedLevel2 {
                val2: NestedLevel3 { val1: 123 }
            }
        };
    }
}