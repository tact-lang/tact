struct Level2 {
    z: Int;
}

struct Level1 {
    y: Level2;
}

contract DeepNest {
    data: Level1;

    init() {
        self.data = Level1{
            y: Level2{
                z: 99,
            },
        };
    }
}
