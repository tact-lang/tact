struct Level0 {
    f0: Int;
    next: Level1;
}

struct Level1 {
    f1: Int;
    next: Level2;
}

struct Level2 {
    f2: Bool;
    next: Level3;
}

struct Level3 {
    f3: Int?;
}

contract ChainStruct {
    link: Level0;

    init() {
        self.link = Level0{
            f0:0, next: Level1{
                f1:1, next: Level2{
                    f2:true, next: Level3{
                        f3:null
                    }
                }
            }
        };
    }
}