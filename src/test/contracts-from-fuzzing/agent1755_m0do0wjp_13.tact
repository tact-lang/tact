struct Level3 {
    v: Int?;
}

struct Level2 {
    mid: Level3;
}

struct Level1 {
    top: Level2;
}

contract TestContract {
    field: Level1 = Level1{
        top: Level2{
            mid: Level3{
                v: null
            }
        }
    };
}
