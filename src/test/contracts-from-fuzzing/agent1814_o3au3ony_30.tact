struct Level3 {
    a: Int;
    b: Int;
}

struct Level2 {
    one: Level3;
    two: Level3;
}

struct Level1 {
    left: Level2;
    right: Level2;
}

contract TreeStruct {
    root: Level1;

    init() {
        self.root = Level1{
            left: Level2{one: Level3{a:1,b:2}, two: Level3{a:3,b:4}},
            right: Level2{one: Level3{a:5,b:6}, two: Level3{a:7,b:8}}
        };
    }
}
