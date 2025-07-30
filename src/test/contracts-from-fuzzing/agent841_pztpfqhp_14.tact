struct Level3 {
    s: String;
}

struct Level2 {
    l3: Level3;
    flag: Bool?;
}

struct Level1 {
    l2: Level2;
}

contract Chain {
    st: Level1;
    init() {
        self.st = Level1{l2: Level2{l3: Level3{s:"foo"}, flag: null}};
    }
}
