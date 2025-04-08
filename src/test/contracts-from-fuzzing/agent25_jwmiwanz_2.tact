struct DeepLevel3 {
    val3: Int;
}

struct DeepLevel2 {
    val2: DeepLevel3;
}

struct DeepLevel1 {
    val1: DeepLevel2;
}

contract DeepNestedStructs {
    deep: DeepLevel1;

    init() {
        self.deep = DeepLevel1{
            val1: DeepLevel2{
                val2: DeepLevel3{
                    val3: 999
                }
            }
        };
    }
}
