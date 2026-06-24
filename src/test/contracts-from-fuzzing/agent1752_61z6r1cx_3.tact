struct Level3 {
    z: Int?;
}

struct Level2 {
    y: Bool;
    deep: Level3;
}

struct Level1 {
    x: Int;
    mid: Level2;
}

contract DeepNestingTest {
    root: Level1;

    init() {
        self.root = Level1{
            x: 1,
            mid: Level2{
                y: false,
                deep: Level3{z: null},
            },
        };
    }
}