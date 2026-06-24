struct Level3 {
    val: Int;
}

struct Level2 {
    nested: Level3;
}

struct Level1 {
    nested: Level2;
}

struct Root {
    nested: Level1;
}

contract DeeplyNestedStorage {
    root: Root;

    init() {
        self.root = Root{
            nested: Level1{
                nested: Level2{
                    nested: Level3{
                        val: 7
                    }
                }
            }
        };
    }
}