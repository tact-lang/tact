struct Level3 {
    z: Int;
}

struct Level2 {
    nested3: Level3;
    y: Int;
}

struct Level1 {
    nested2: Level2;
    x: Int;
}

contract TestContract {
    field: Level1;

    init() {
        self.field = Level1{
            nested2: Level2{
                nested3: Level3{z: 3},
                y: 2
            },
            x: 1
        };
    }
}