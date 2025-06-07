struct Level3 {
    x: Int;
}

struct Level2 {
    nested: Level3;
}

struct Level1 {
    nested: Level2;
}

struct TopLevel {
    nested: Level1;
}

contract TestContract {
    field: TopLevel;

    init() {
        self.field = TopLevel{
            nested: Level1{
                nested: Level2{
                    nested: Level3{
                        x: 123
                    }
                }
            }
        };
    }
}