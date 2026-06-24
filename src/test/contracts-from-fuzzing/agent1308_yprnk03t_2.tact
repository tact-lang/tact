struct DeepNest {
    level1: Int;
    level2: Level2;
}

struct Level2 {
    level3: Level3?;
}

struct Level3 {
    value: Int;
}

contract TestContract {
    data: DeepNest;
    
    init() {
        self.data = DeepNest {
            level1: 1,
            level2: Level2 {
                level3: null
            }
        };
    }
}