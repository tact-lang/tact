struct DeepRec {
    f1: Int;
    f2: Level1;
}

struct Level1 {
    x: Int;
    y: Level2;
}

struct Level2 {
    m: Int?;
    n: Bool?;
    z: Level3;
}

struct Level3 {
    q: String;
    r: Int?;
}

contract Test {
    dr: DeepRec;

    init() {
        self.dr = DeepRec{
            f1:1,
            f2: Level1{
                x:2,
                y: Level2{
                    m:3,n:true,
                    z: Level3{q:"s",r:null}
                }
            }
        };
    }
}