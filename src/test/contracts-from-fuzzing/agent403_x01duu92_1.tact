struct Level3 {
    x: Int;
}

struct Level2 {
    lvl3: Level3;
    y: Int;
}

struct Level1 {
    lvl2: Level2;
    z: Bool;
}

contract DeepNested {
    nested: Level1;

    init() {
        self.nested = Level1{
            lvl2: Level2{
                lvl3: Level3{x: 42},
                y: 2
            },
            z: true
        };
    }
}
