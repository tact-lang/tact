struct Level3 {
    val3: Int;
}

struct Level2 {
    val2: Bool;
    inner3: Level3;
}

struct Level1 {
    val1: Int;
    inner2: Level2;
}

contract DeepNested {
    nested: Level1;

    init() {
        self.nested = Level1{
            val1: 1,
            inner2: Level2{
                val2: true,
                inner3: Level3{val3: 3}
            }
        };
    }
}
