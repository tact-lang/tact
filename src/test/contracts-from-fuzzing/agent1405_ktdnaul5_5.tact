struct Level3 {
    z: Int;
}

struct Level2 {
    y: Int;
    deep: Level3;
}

struct Level1 {
    x: Int;
    nested: Level2;
}

contract ThreeLevelNested {
    data: Level1;

    init() {
        self.data = Level1{
            x: 11,
            nested: Level2{
                y: 22,
                deep: Level3{ z: 33 }
            }
        };
    }
}