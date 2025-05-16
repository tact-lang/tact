struct NestedLevel3 {
    val3a: Int;
    val3b: Bool?;
}

struct NestedLevel2 {
    val2: NestedLevel3;
}

struct NestedLevel1 {
    val1: NestedLevel2;
}

contract DeepNest {
    nest: NestedLevel1;

    init() {
        self.nest = NestedLevel1{
            val1: NestedLevel2{
                val2: NestedLevel3{
                    val3a: 10,
                    val3b: null,
                }
            }
        };
    }
}