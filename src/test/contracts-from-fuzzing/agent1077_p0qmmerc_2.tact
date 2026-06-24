struct Level3 {
    val3: Int;
}

struct Level2 {
    val2: Int;
    level3: Level3;
}

struct Level1 {
    val1: Int;
    level2: Level2;
}

contract DeepNestedContract {
    nestedData: Level1;

    init() {
        self.nestedData = Level1{
            val1: 1,
            level2: Level2{
                val2: 2,
                level3: Level3{
                    val3: 3,
                },
            },
        };
    }
}