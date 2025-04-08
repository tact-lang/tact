struct Level3 {
    a: Int;
    b: Bool;
    c: Int?;
}

struct Level2 {
    l3First: Level3;
    l3Second: Level3;
}

struct Level1 {
    l2First: Level2;
    l2Second: Level2;
    flag: Bool;
}

contract DeepHierarchy {
    root: Level1;

    init() {
        self.root = Level1{
            l2First: Level2{
                l3First: Level3{a:1,b:true,c:null},
                l3Second: Level3{a:2,b:false,c:3},
            },
            l2Second: Level2{
                l3First: Level3{a:4,b:true,c:null},
                l3Second: Level3{a:5,b:false,c:6},
            },
            flag: true
        };
    }
}