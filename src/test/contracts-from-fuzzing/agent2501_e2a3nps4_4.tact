struct DeepNest {
    level1: Int;
    next: DeepNest2;
}

struct DeepNest2 {
    level2: Int;
    next: DeepNest3;
}

struct DeepNest3 {
    level3: Int;
}

contract NestedDepthTest {
    storage: DeepNest;

    init() {
        self.storage = DeepNest{
            level1: 1,
            next: DeepNest2{
                level2: 2,
                next: DeepNest3{ level3: 3 }
            }
        };
    }
}