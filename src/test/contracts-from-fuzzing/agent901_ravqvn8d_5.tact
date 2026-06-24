struct Level3 {
    val1: Int;
    val2: String;
}

struct Level2 {
    inner1: Level3;
    inner2: Level3;
}

struct Level1 {
    l2: Level2;
}

contract DeepNested {
    storage: Level1;

    init() {
        self.storage = Level1{
            l2: Level2{
                inner1: Level3{val1: 1, val2: "a"},
                inner2: Level3{val1: 2, val2: "b"}
            }
        };
    }
}