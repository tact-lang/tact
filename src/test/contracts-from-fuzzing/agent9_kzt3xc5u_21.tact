struct Level3 {
    a: Int;
}

struct Level2 {
    a: Int;
    l3: Level3;
}

struct Level1 {
    a: Int;
    l2: Level2;
}

contract WideDeepNested {
    a: Int;
    nest: Level1;

    init() {
        self.a = 999;
        self.nest = Level1{
            a: 11,
            l2: Level2{
                a: 22,
                l3: Level3{
                    a: 33
                }
            }
        };
    }
}