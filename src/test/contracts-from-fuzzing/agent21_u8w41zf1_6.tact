struct Level3 {
    iv: Int;
    bv: Bool;
    ov: Int?;
}

struct Level2 {
    l3a: Level3;
    l3b: Level3?;
}

struct Level1 {
    l2: Level2;
    l2opt: Level2?;
    flag: Bool?
}

contract DeeplyNestedMix {
    lvl1: Level1;

    init() {
        self.lvl1 = Level1{
            l2: Level2{l3a: Level3{iv: 3, bv: true, ov: null}, l3b: null},
            l2opt: null,
            flag: null
        };
    }

    receive() {}
}