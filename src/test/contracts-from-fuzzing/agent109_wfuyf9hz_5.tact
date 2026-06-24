struct Deep {
    a: Int?;
    b: Int?;
    c: Level1?;
}

struct Level1 {
    d: Int?;
    e: Int?;
    f: Level2?;
}

struct Level2 {
    g: Int?;
    h: Int?;
    i: Level3?;
}

struct Level3 {
    j: Int?;
    k: Int?;
}

contract Test {
    d: Deep;

    init() {
        self.d = Deep{
            a:null,b:null,
            c: Level1{
                d:null,e:null,
                f: Level2{
                    g:null,h:null,
                    i: Level3{j:null,k:null}
                }
            }
        };
    }
}
