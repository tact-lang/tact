struct NestedOptional {
    val1: Int?; 
    val2: Bool?; 
}

struct DeepNest {
    nested: NestedOptional; 
    flag: Bool;
}

contract ComplexDeepNested {
    data: DeepNest;

    init() {
        self.data = DeepNest{
            nested: NestedOptional{
                val1: null,
                val2: true,
            },
            flag: false,
        };
    }
}
