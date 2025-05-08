struct Level3 {
    z: Int;
}

struct Level2 {
    y: Level3;
}

struct Level1 {
    x: Level2;
}

contract DeepNested {
    root: Level1;

    init() {
        self.root = Level1{
            x: Level2{
                y: Level3{
                    z: 123
                }
            }
        };
    }
}