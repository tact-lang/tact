struct NestedLevel3 {
    z: Int;
}

struct NestedLevel2 {
    y: NestedLevel3;
}

struct NestedLevel1 {
    x: NestedLevel2;
}

contract DeepNestState {
    nested: NestedLevel1;

    init() {
        self.nested = NestedLevel1{
            x: NestedLevel2{
                y: NestedLevel3{
                    z: 100
                }
            }
        };
    }
}