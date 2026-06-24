struct Deep {
    inner1: Int;
    inner2: Level1;
}

struct Level1 {
    val: Level2;
}

struct Level2 {
    val: Level3;
}

struct Level3 {
    val: Int;
}

contract TestContract {
    field: Deep;

    init() {
        self.field = Deep{
            inner1: 5,
            inner2: Level1{
                val: Level2{
                    val: Level3{ val: 42 }
                }
            }
        };
    }
}