struct Level3 {
    a: Int?;
    b: Bool?;
}

struct Level2 {
    l3a: Level3;
    l3b: Level3;
}

struct Level1 {
    l2a: Level2;
    l2b: Level2;
}

contract DeepOptionals {
    p1: Int?;
    p2: Bool?;
    nest: Level1;

    init() {
        self.p1 = null;
        self.p2 = true;
        self.nest = Level1{
            l2a: Level2{
                l3a: Level3{a:null,b:false},
                l3b: Level3{a:5,b:true}
            },
            l2b: Level2{
                l3a: Level3{a:null,b:null},
                l3b: Level3{a:10,b:true}
            }
        };
    }
}