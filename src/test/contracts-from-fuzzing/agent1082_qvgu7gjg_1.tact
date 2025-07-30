struct DeeplyNested {
    level1: Int;
    level2: NestedLevel2;
}

struct NestedLevel2 {
    l2field: Int;
    level3: NestedLevel3?
}

struct NestedLevel3 {
    l3field: Int;
    level4: NestedLevel4;
}

struct NestedLevel4 {
    l4field: Int;
}

contract TestContract {
    storage: DeeplyNested;

    init() {
        self.storage = DeeplyNested{
            level1: 1,
            level2: NestedLevel2{
                l2field: 2,
                level3: NestedLevel3{
                    l3field: 3,
                    level4: NestedLevel4{
                        l4field: 4,
                    }
                }
            }
        };
    }
}
