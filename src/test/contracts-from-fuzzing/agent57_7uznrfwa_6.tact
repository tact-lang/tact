struct Level3 {
    x: Int;
    y: Bool;
}

struct Level2 {
    l3a: Level3;
    l3b: Level3;
}

struct Level1 {
    l2a: Level2;
    l2b: Level2;
}

contract DeepNested {
    root: Level1;

    init() {
        self.root = Level1{
            l2a: Level2{ l3a: Level3{ x:1,y:true }, l3b: Level3{ x:2,y:false } },
            l2b: Level2{ l3a: Level3{ x:3,y:true }, l3b: Level3{ x:4,y:false } }
        };
    }
}