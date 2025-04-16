struct Level3 {
    d: Int;
}

struct Level2 {
    c: Level3;
}

struct Level1 {
    b: Level2;
}

struct Root {
    a: Level1;
}

contract DeepNesting {
    root: Root;

    init() {
        self.root = Root{
            a: Level1{
                b: Level2{
                    c: Level3{
                        d: 99
                    }
                }
            }
        };
    }
}