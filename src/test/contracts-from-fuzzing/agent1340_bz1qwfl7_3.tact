struct Level2 {
    num: Int;
}

struct Level1 {
    nested: Level2;
}

struct Top {
    l1: Level1;
}

contract DeepNested {
    data: Top;

    init() {
        self.data = Top{
            l1: Level1{
                nested: Level2{ num: 7 }
            }
        };
    }
}