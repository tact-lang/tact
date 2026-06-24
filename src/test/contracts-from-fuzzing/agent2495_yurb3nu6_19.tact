struct Level1 {
    x: Int;
}

struct Level2 {
    l1: Level1;
    flag: Bool;
}

struct Level3 {
    l2a: Level2;
    l2b: Level2;
}

contract TwoInnerStructs {
    l3: Level3;
    
    init() {
        self.l3 = Level3{
            l2a: Level2{ l1: Level1{x:1}, flag:true },
            l2b: Level2{ l1: Level1{x:2}, flag:false }
        };
    }
}