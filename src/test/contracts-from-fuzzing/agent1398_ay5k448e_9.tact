struct Level3 {
    z: Int;
}

struct Level2 {
    y: Int;
    next: Level3;
}

struct Level1 {
    x: Int;
    next: Level2;
}

contract IndirectDeepNest {
    nested: Level1;

    init() {
        self.nested = Level1{
            x: 11,
            next: Level2{
                y: 22,
                next: Level3{
                    z: 33,
                },
            },
        };
    }
}