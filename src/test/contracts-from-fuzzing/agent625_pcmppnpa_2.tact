struct Level3 {
    x: Int;
}

struct Level2 {
    z: Bool;
    lvl3: Level3;
}

struct Level1 {
    name: String;
    lvl2: Level2;
}

contract DeepNest {
    data: Level1;
    init() {
        self.data = Level1 {
            name: "abc",
            lvl2: Level2 {
                z: true,
                lvl3: Level3 {
                    x: 42
                }
            }
        };
    }
}