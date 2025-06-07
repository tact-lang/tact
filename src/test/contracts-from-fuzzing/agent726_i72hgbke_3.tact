struct Level3 {
    deepValue: Int;
}

struct Level2 {
    nestedOpt: Level3?;
}

struct Level1 {
    nested: Level2;
}

contract DeepNesting {
    storage: Level1;

    init() {
        self.storage = Level1{
            nested: Level2{
                nestedOpt: null,
            },
        };
    }

    receive() {
        self.storage = Level1{
            nested: Level2{
                nestedOpt: Level3{ deepValue: 123 },
            },
        };
    }
}