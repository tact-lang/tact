struct Level3 {
    z: String;
}

struct Level2 {
    y: Level3;
}

struct Level1 {
    x: Level2;
}

contract DeepNested {
    deep: Level1;

    init() {
        self.deep = Level1 {
            x: Level2 {
                y: Level3 {
                    z: "deep!"
                }
            }
        };
    }
}