struct Level3 {
    val3a: Int?;
    val3b: Bool;
}

struct Level2 {
    val2: Level3?;
}

struct Level1 {
    val1a: Int;
    val1b: Level2;
}

contract TestContract {
    storage: Level1;

    init() {
        self.storage = Level1{
            val1a: 7,
            val1b: Level2{
                val2: Level3{
                    val3a: null,
                    val3b: true
                }
            }
        };
    }
}