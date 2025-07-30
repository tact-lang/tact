struct Deep {
    a: Int;
    b: Level1;
}

struct Level1 {
    c: Int;
    d: Level2;
}

struct Level2 {
    e: Int;
    f: Level3;
}

struct Level3 {
    g: Int;
    h: String;
    i: Bool?;
}

contract DeepPersist {
    s: Deep;

    init() {
        self.s = Deep{
            a:1,
            b: Level1{
                c:2,
                d: Level2{
                    e:3,
                    f: Level3{
                        g:4,
                        h:"hi",
                        i:null
                    }
                }
            }
        };
    }
}