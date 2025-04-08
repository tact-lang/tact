struct Level2 {
    a: Int;
    b: Int;
    c: Int?;
}

struct Level1 {
    nested: Level2;
    opt: Int?;
}

contract Test {
    l1: Level1;

    init() {
        self.l1 = Level1{
            nested: Level2{ a:1, b:2, c:null },
            opt: null
        };
    }
}