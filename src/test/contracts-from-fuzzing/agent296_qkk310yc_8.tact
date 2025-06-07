struct Level3 {
    deep: Int;
}

struct Level2 {
    middle: Level3;
}

struct Level1 {
    shallow: Level2;
}

contract ThreeLayers {
    val: Level1;

    init() {
        self.val = Level1{
            shallow: Level2{
                middle: Level3{
                    deep: 999
                }
            }
        };
    }
}
