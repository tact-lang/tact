// Large nested struct with many levels
struct Level3 {
    a: Int;
    b: Bool;
}

struct Level2 {
    l3a: Level3;
    l3b: Level3;
}

struct Level1 {
    l2: Level2;
}

contract DeepNest {
    info: Level1;

    init() {
        self.info = Level1{
            l2: Level2{
                l3a: Level3{a:1,b:true},
                l3b: Level3{a:2,b:false}
            }
        };
    }
}