struct Level3 {
    a: Int; 
}

struct Level2 {
    l3a: Level3;
    l3b: Level3;
}

struct Level1 {
    l2a: Level2;
    l2b: Level2;
    l2c: Level2;
}

contract DeepWide {
    root: Level1;

    init() {
        self.root = Level1{
            l2a: Level2{l3a: Level3{a:1}, l3b: Level3{a:2}},
            l2b: Level2{l3a: Level3{a:3}, l3b: Level3{a:4}},
            l2c: Level2{l3a: Level3{a:5}, l3b: Level3{a:6}}
        };
    }
}