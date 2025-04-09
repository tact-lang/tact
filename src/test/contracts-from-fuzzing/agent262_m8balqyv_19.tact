struct Levels3 {
    a: Int;
    b: Int;
}

struct Levels2 {
    l3_1: Levels3;
    l3_2: Levels3;
}

struct Levels1 {
    l2_1: Levels2;
    l2_2: Levels2;
}

contract ThreeLevels {
    root: Levels1;

    init() {
        self.root = Levels1{
            l2_1: Levels2{
                l3_1: Levels3{a:1,b:2},
                l3_2: Levels3{a:3,b:4}
            },
            l2_2: Levels2{
                l3_1: Levels3{a:5,b:6},
                l3_2: Levels3{a:7,b:8}
            }
        };
    }
}
