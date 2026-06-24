struct Level3 {
    val3: Int?;
}

struct Level2 {
    val2: Int;
    inner3: Level3;
}

struct Level1 {
    val1: Bool;
    inner2: Level2;
}

contract DeepNested {
    data: Level1;

    init() {
        self.data = Level1{
            val1: true,
            inner2: Level2{
                val2: 7,
                inner3: Level3{
                    val3: null
                }
            }
        };
    }
}