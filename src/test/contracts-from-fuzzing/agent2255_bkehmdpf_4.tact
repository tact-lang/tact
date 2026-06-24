struct NestedLevel2 {
    val: Int;
}

struct NestedLevel1 {
    nested: NestedLevel2;
}

struct Top {
    nested: NestedLevel1;
}

contract DeepNest {
    s: Top;

    init() {
        self.s = Top{
            nested: NestedLevel1{
                nested: NestedLevel2 {
                    val: 999
                }
            }
        };
    }
}
