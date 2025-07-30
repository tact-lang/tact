struct Level1 {
    x: Int;
    lvl2: Level2;
}

struct Level2 {
    y: Bool;
    lvl3: Level3;
}

struct Level3 {
    z: String;
    flag: Bool?;
}

contract DeepNestedTest {
    root: Level1;

    init() {
        self.root = Level1 {
            x: 5,
            lvl2: Level2 {
                y: true,
                lvl3: Level3 {
                    z: "end",
                    flag: null
                }
            }
        };
    }
}
