struct DeepNest {
    a: Int;
    b: Level1;
}

struct Level1 {
    x: Int; 
    y: Level2;
    z: String;
}

struct Level2 {
    k: Bool;
    q: Level3;
}

struct Level3 {
    m: Int?;
    n: Bool?;
}

contract Test {
    dn: DeepNest;

    init() {
        self.dn = DeepNest{
            a: 42,
            b: Level1{
                x: 2,
                y: Level2{
                    k: true,
                    q: Level3{m:null,n:false}
                },
                z: "hi"
            }
        };
    }
}