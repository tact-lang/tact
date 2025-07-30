struct DeepNestLevel4 {
    val: Int?;
}

struct DeepNestLevel3 {
    nested: DeepNestLevel4;
}

struct DeepNestLevel2 {
    nested: DeepNestLevel3;
}

struct DeepNestLevel1 {
    nested: DeepNestLevel2;
}

contract TestContract {
    data: DeepNestLevel1;

    init() {
        self.data = DeepNestLevel1{
            nested: DeepNestLevel2{
                nested: DeepNestLevel3{
                    nested: DeepNestLevel4{
                        val: null
                    }
                }
            }
        };
    }
}
