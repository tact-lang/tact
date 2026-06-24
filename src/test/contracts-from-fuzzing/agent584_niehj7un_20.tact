struct Level2 {
    v: Int;
}

struct Level1 {
    l2: Level2;
}

struct Root {
    l1: Level1;
}

contract DeepFlat {
    root: Root;

    init() {
        self.root = Root{
            l1: Level1{
                l2: Level2{
                    v: 123
                }
            }
        };
    }
}