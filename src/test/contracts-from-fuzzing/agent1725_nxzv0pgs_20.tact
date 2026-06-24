struct Level4 {
    x: Int;
}

struct Level3 {
    nested: Level4;
}

struct Level2 {
    nested: Level3;
}

struct Level1 {
    nested: Level2;
}

contract TestContract {
    data: Level1;

    init() {
        self.data = Level1{
            nested: Level2{
                nested: Level3{
                    nested: Level4{
                        x: 77
                    }
                }
            }
        };
    }
}