struct DeepNestLevel3 {
    value: Int;
}

struct DeepNestLevel2 {
    next: DeepNestLevel3;
}

struct DeepNestLevel1 {
    next: DeepNestLevel2;
}

contract DeepNestContract {
    val: DeepNestLevel1;

    init() {
        self.val = DeepNestLevel1{
            next: DeepNestLevel2{
                next: DeepNestLevel3{
                    value: 42
                }
            }
        };
    }
}
