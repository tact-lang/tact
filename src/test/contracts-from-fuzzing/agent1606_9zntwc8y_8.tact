struct Level3 {
    value: Int;
}

struct Level2 {
    l3: Level3;
    optL3: Level3?;
}

struct Level1 {
    l2: Level2;
    optL2: Level2?;
}

contract DeepNestOptionals {
    state: Level1;

    init() {
        self.state = Level1{
            l2: Level2{
                l3: Level3{ value: 1 },
                optL3: null,
            },
            optL2: null,
        };
    }

    receive() {
        let s = self.state;
    }
}