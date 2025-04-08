struct DeepNestLevel3 {
    c: Int;
}

struct DeepNestLevel2 {
    b: DeepNestLevel3;
}

struct DeepNestLevel1 {
    a: DeepNestLevel2;
}

contract TestContract {
    deep: DeepNestLevel1;

    init() {
        self.deep = DeepNestLevel1{
            a: DeepNestLevel2{
                b: DeepNestLevel3{
                    c: 42
                }
            }
        };
    }
}