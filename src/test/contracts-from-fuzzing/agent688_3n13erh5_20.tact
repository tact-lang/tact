struct Level1 {
    a: Int;
    b: Bool;
}

struct Level2 {
    l1a: Level1;
    l1b: Level1;
}

struct Level3 {
    l2a: Level2;
    l2b: Level2;
}

struct Level4 {
    l3: Level3;
}

contract TestContract {
    root: Level4;

    init() {
        self.root = Level4{
            l3: Level3{
                l2a: Level2{
                    l1a: Level1{a:1,b:true},
                    l1b: Level1{a:2,b:false}
                },
                l2b: Level2{
                    l1a: Level1{a:3,b:true},
                    l1b: Level1{a:4,b:false}
                }
            }
        };
    }
}