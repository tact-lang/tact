struct Level3 {
    z: Int;
}

struct Level2 {
    y: Level3;
}

struct Level1 {
    x: Level2;
}

contract ChainNested {
    data: Level1;

    init() {
        self.data = Level1 {
            x: Level2 {
                y: Level3 { z: 777 }
            }
        };
    }
}