struct Level1 {
    a: Int;
    b: Bool;
}

struct Level2 {
    l1a: Level1;
    l1b: Level1;
}

struct Level3 {
    l2: Level2;
}

contract DuplicateStructs {
    root: Level3;

    init() {
        self.root = Level3{
            l2: Level2{
                l1a: Level1{a:1, b:true},
                l1b: Level1{a:2, b:false}
            }
        };
    }
}