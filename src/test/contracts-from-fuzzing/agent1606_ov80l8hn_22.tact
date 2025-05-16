struct Level3 {
    val3: String;
}

struct Level2 {
    val2: Level3?;
}

struct Level1 {
    val1: Level2?;
}

contract DeepOptionalMixed {
    field: Level1;

    init() {
        self.field = Level1{
            val1: Level2{
                val2: null
            }
        };
    }
}
