struct NestedLevel2 {
    val2: Int;
    flag2: Bool;
}

struct NestedLevel1 {
    val1: Int;
    nested2: NestedLevel2;
}

contract DeepNested {
    nested: NestedLevel1;
    
    init() {
        self.nested = NestedLevel1{
            val1: 1,
            nested2: NestedLevel2{val2: 2, flag2: false}
        };
    }
}