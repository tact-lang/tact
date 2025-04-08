struct Level3 {
    c: Int;
}

struct Level2 {
    b: Level3;
}

struct Level1 {
    a: Level2;
}

contract Deepnest {
    nest: Level1;

    init() {
        self.nest = Level1{a: Level2{b: Level3{c: 10}}};
    }
}
