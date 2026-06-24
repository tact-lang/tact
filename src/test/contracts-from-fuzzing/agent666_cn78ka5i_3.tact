struct Deep {
    nested1: Level1;
}

struct Level1 {
    nested2: Level2;
}

struct Level2 {
    val: Int;
}

contract DeepNest {
    store: Deep;

    init() {
        self.store = Deep{
            nested1: Level1{
                nested2: Level2{
                    val: 123
                }
            }
        };
    }
}
