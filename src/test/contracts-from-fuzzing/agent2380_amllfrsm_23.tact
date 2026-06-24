struct Level3 {
    a: Int; b: Bool; c: String; d: Address; e: Int?;
}

struct Level2 {
    x1: Level3;
    x2: Level3;
    num: Int;
}

struct Level1 {
    y1: Level2;
    y2: Level2;
    flag: Bool;
}

contract TestContract {
    nested: Level1;
    init() {
        self.nested = Level1{
            y1: Level2{
                x1: Level3{a:1,b:true,c:"hi",d:myAddress(),e:null},
                x2: Level3{a:2,b:false,c:"bye",d:myAddress(),e:5},
                num: 42
            },
            y2: Level2{
                x1: Level3{a:3,b:true,c:"foo",d:myAddress(),e:null},
                x2: Level3{a:4,b:false,c:"bar",d:myAddress(),e:6},
                num: 77
            },
            flag: true
        };
    }
}