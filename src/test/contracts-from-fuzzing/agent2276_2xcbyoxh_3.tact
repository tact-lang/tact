struct DeepLevel3 {
    leaf: String;
}

struct DeepLevel2 {
    level3: DeepLevel3;
}

struct DeepLevel1 {
    level2: DeepLevel2;
}

contract DeepNestedTest {
    root: DeepLevel1;

    init() {
        self.root = DeepLevel1{
            level2: DeepLevel2{
                level3: DeepLevel3{
                    leaf: "Leaf node"
                }
            }
        };
    }
}