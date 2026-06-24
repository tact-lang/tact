struct Level3 {
    a: Int;
    b: Bool;
}

struct Level2 {
    l3_1: Level3;
    l3_2: Level3;
}

struct Level1 {
    l2: Level2;
}

contract Test {
    nested: Level1;

    init() {
        self.nested = Level1 {
            l2: Level2 {
                l3_1: Level3 { a:1, b:true },
                l3_2: Level3 { a:2, b:false }
            }
        };
    }
}