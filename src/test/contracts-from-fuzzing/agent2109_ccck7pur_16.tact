struct Level1 {
    a: Int;
    b: Int;
}
struct Level2 {
    lvl1: Level1;
    c: Int;
}
struct Level3 {
    lvl2: Level2;
    d: Int;
}
struct Level4 {
    lvl3: Level3;
    e: Int;
}

contract DeeplyNested {
    s: Level4;

    init() {
        self.s = Level4{
            lvl3: Level3{
                lvl2: Level2{
                    lvl1: Level1{
                        a:1,
                        b:2
                    },
                    c:3
                },
                d:4
            },
            e:5
        };
    }
}