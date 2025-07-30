struct MultipleLevel {
    lvl1: Level1;
}

struct Level1 {
    lvl2: Level2;
}

struct Level2 {
    lvl3: Level3;
}

struct Level3 {
    x: Int;
    y: Bool;
    z: Int?;
}

contract FourLayerStorage {
    s: MultipleLevel;

    init() {
        self.s = MultipleLevel{
            lvl1: Level1{
                lvl2: Level2{
                    lvl3: Level3{
                        x: 9,
                        y: true,
                        z: null,
                    }
                }
            }
        };
    }
}
