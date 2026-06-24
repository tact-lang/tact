struct Level3 {
    x: Int;
}

struct Level2 {
    l3: Level3;
}

struct Level1 {
    l2: Level2;
}

contract SerialNest {
    val: Level1;

    init() {
        self.val = Level1{
            l2: Level2{
                l3: Level3{
                    x: 7,
                }
            }
        };
    }
}