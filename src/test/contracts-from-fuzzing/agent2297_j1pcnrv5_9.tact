struct Level1 {
    val: Int;
}

struct Level2 {
    l1: Level1;
    val: Int;
}

struct Level3 {
    l2: Level2;
    valOpt: Int?;
}

contract Test {
    l3: Level3;

    init() {
        self.l3 = Level3{
            l2: Level2{l1: Level1{val: 11}, val: 22},
            valOpt: null
        };
    }
}