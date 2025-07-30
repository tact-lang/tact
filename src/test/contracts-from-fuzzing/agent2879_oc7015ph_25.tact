struct Level4 {
    x: Int;
    y: Bool;
}

struct Level3 {
    l4: Level4;
}

struct Level2 {
    l3: Level3;
}

struct Level1 {
    l2: Level2;
}

contract Test {
    nested: Level1;

    init() {
        self.nested = Level1{l2: Level2{l3: Level3{l4: Level4{x:10,y:true}}}};
    }
}