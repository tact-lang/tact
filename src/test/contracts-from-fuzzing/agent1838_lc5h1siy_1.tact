struct NestedLevel3 {
    z: Int;
}

struct NestedLevel2 {
    y: Int;
    deep: NestedLevel3;
}

struct NestedLevel1 {
    x: Int;
    deeper: NestedLevel2;
}

contract DeepNested {
    data: NestedLevel1;

    init() {
        self.data = NestedLevel1{
            x: 1,
            deeper: NestedLevel2{
                y: 2,
                deep: NestedLevel3{
                    z: 3
                }
            }
        };
    }
}
