struct BaseLevel {
    iv: Int;
}

struct Level2 {
    base: BaseLevel;
}

struct Level3 {
    l2: Level2;
}

struct Level4 {
    l3: Level3;
}

contract TestContract {
    state: Level4;

    init() {
        self.state = Level4{
            l3: Level3{
                l2: Level2{
                    base: BaseLevel{
                        iv: 999,
                    },
                },
            },
        };
    }
}
