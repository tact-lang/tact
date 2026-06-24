struct Level1 {
    f: Int;
}

struct Level2 {
    f: Level1;
}

struct Level3 {
    f: Level2;
}

struct Level4 {
    f: Level3;
}

struct Level5 {
    f: Level4;
}

struct Level6 {
    f: Level5;
}

contract Deep6 {
    state: Level6 = Level6{
        f: Level5{
            f: Level4{
                f: Level3{
                    f: Level2{
                        f: Level1{f: 42}
                    }
                }
            }
        }
    };
}