struct NestedLevel3 {
    deep: Bool;
}

struct NestedLevel2 {
    level3: NestedLevel3;
}

struct NestedLevel1 {
    level2: NestedLevel2;
}

contract ThreeDeep {
    root: NestedLevel1;

    init() {
        self.root = NestedLevel1{
            level2: NestedLevel2{
                level3: NestedLevel3{
                    deep: true
                }
            }
        };
    }
}