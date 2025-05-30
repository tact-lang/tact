struct Level1 {
    x: Int;
    y: Bool;
}

struct Level2 {
    f1: Level1;
    f2: Level1?;
}

struct Level3 {
    s1: Level2;
    s2: Level2?;
}

struct Level4 {
    m1: Level3;
    m2: Level3?;
}

contract TestContract {
    nest: Level4;

    init() {
        self.nest = Level4{
            m1: Level3{
                s1: Level2{
                    f1: Level1{ x:1,y:true },
                    f2: null,
                },
                s2: null,
            },
            m2: null,
        };
    }
}