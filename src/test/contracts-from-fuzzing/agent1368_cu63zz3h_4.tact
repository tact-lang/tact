struct Level3 {
    val3a: Int;
    val3b: Int?;
}

struct Level2 {
    val2: Level3?;
}

struct Level1 {
    val1: Level2?;
}

contract OptionalDeep {
    storageRoot: Level1?;

    init() {
        self.storageRoot = Level1{
            val1: Level2{
                val2: Level3{
                    val3a: 42,
                    val3b: null
                }
            }
        };
    }
}
