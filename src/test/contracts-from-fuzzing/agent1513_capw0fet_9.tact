struct Level3 {
    deep: Int;
}

struct Level2 {
    next: Level3;
}

struct Level1 {
    wrap: Level2;
}

contract ThreeLevelDeep {
    val: Level1;

    init() {
        self.val = Level1{
            wrap: Level2{
                next: Level3{
                    deep: 9999
                }
            }
        };
    }
}