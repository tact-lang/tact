struct DeepNestLevel3 {
    val3: Int;
}

struct DeepNestLevel2 {
    val2: Int?;
    nested3: DeepNestLevel3;
}

struct DeepNestLevel1 {
    val1: Bool;
    nested2: DeepNestLevel2;
}

contract TestDeepNested {
    data: DeepNestLevel1;

    init() {
        self.data = DeepNestLevel1{
            val1: true,
            nested2: DeepNestLevel2{
                val2: null,
                nested3: DeepNestLevel3{
                    val3: 42
                }
            }
        };
    }
}