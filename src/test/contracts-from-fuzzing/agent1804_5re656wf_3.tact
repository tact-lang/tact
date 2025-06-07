struct Level3 {
    z: Int;
}

struct Level2 {
    y: Int;
    l3: Level3;
}

struct Level1 {
    x: Int;
    l2: Level2;
}

contract ThreeLevelsDeep {
    nested: Level1;

    init() {
        self.nested = Level1{
            x: 7,
            l2: Level2{
                y: 8,
                l3: Level3{ z: 9 }
            }
        };
    }
}