struct Level3 {
    val: Int?;
}

struct Level2 {
    nested: Level3;
}

struct Level1 {
    nested: Level2;
}

contract DeepNestedContract {
    storage: Level1;

    init() {
        self.storage = Level1{
            nested: Level2{
                nested: Level3{
                    val: 42
                }
            }
        };
    }
}