struct Level3 {
    val: Int;
}

struct Level2 {
    nested: Level3;
}

struct Level1 {
    deeper: Level2;
}

contract DeepNested {
    state: Level1;

    init() {
        self.state = Level1{
            deeper: Level2{
                nested: Level3{
                    val: 999
                }
            }
        };
    }
}