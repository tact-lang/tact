struct Level3 {
    val3: Int?;
}

struct Level2 {
    val2: Int;
    l3: Level3;
}

struct Level1 {
    val1: Int;
    l2: Level2;
}

contract MultiNestedContract {
    deepData: Level1;

    init() {
        self.deepData = Level1{
            val1: 1,
            l2: Level2{
                val2: 2,
                l3: Level3{
                    val3: null,
                },
            },
        };
    }
}