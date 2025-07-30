struct Level3 {
    value: Int;
}

struct Level2 {
    next: Level3;
    value: Int;
}

struct Level1 {
    next: Level2;
    value: Int;
}

contract NestedLevels {
    root: Level1;

    init() {
        self.root = Level1{
            next: Level2{
                next: Level3{
                    value: 7
                },
                value: 6
            },
            value: 5
        };
    }
}