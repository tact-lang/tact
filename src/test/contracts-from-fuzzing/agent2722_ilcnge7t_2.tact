struct DeepNestLevel3 {
    val3: Int;
    opt3: Bool?;
}

struct DeepNestLevel2 {
    val2: Int;
    nest3: DeepNestLevel3;
}

struct DeepNestLevel1 {
    val1: Int;
    nest2: DeepNestLevel2;
}

contract DeepNestedStorage {
    data: DeepNestLevel1;

    init() {
        self.data = DeepNestLevel1 {
            val1: 1,
            nest2: DeepNestLevel2 {
                val2: 2,
                nest3: DeepNestLevel3 {
                    val3: 3,
                    opt3: null,
                }
            }
        };
    }
}
