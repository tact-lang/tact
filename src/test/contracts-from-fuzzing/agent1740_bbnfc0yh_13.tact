struct Level3 {
    alpha: Int;
    beta: Bool;
}

struct Level2 {
    gamma: Level3;
    delta: Int;
}

struct Level1 {
    epsilon: Level2;
    zeta: Bool;
}

contract NestedMany {
    nest: Level1 = Level1{
        epsilon: Level2{
            gamma: Level3{
                alpha: 1,
                beta: true
            },
            delta: 2
        },
        zeta: false
    };

    init() {
        self.nest = Level1{
            epsilon: Level2{
                gamma: Level3{
                    alpha: 10,
                    beta: false
                },
                delta: 20
            },
            zeta: true
        };
    }
}