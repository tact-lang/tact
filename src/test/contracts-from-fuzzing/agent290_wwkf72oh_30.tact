struct DeepNest {
    a: Level1;
}

struct Level1 {
    b: Level2;
}

struct Level2 {
    c: Level3;
}

struct Level3 {
    d: Level4;
}

struct Level4 {
    e: Level5;
}

struct Level5 {
    val: Int;
}

contract TestContract {
    x: DeepNest = DeepNest{
        a: Level1{
            b: Level2{
                c: Level3{
                    d: Level4{
                        e: Level5{val:42}
                    }
                }
            }
        }
    };
}
