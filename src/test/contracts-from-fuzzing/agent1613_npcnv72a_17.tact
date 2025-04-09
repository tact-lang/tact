struct Level4 {
    w: String?;
    x: Bool;
}

struct Level3 {
    y: Level4;
    z: Int?;
}

struct Level2 {
    a: Bool?;
    b: Level3;
}

struct Level1 {
    c: Int;
    d: Level2?;
}

contract ComplexNest {
    root: Level1;

    init() {
        self.root = Level1{
            c:7,
            d: Level2{
                a:null,
                b:Level3{
                    y:Level4{w:null,x:true},
                    z:null,
                }
            }
        };
    }
}
