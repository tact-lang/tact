struct Deep {
    a: Level2;
}

struct Level2 {
    b: Level3;
    c: Int;
}

struct Level3 {
    d: Level4;
}

struct Level4 {
    e: Int;
}

contract DeepNest {
    val: Deep = Deep{
        a: Level2{
            b: Level3{
                d: Level4{ e: 777 }
            },
            c: 888
        }
    };

    receive() {}
}