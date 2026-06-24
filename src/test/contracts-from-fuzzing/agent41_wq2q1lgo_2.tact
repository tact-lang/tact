struct DeepNestLevel3 {
    val: Int;
}

struct DeepNestLevel2 {
    nested: DeepNestLevel3;
}

struct DeepNestLevel1 {
    nested: DeepNestLevel2;
}

contract TestContract {
    nestedField: DeepNestLevel1;

    init() {
        self.nestedField = DeepNestLevel1{
            nested: DeepNestLevel2{
                nested: DeepNestLevel3{
                    val: 42
                }
            }
        };
    }
}