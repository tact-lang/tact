struct Level3 {
    flag: Bool;
    comment: String;
}

struct Level2 {
    id: Int;
    info: Level3;
}

struct Level1 {
    l2_1: Level2;
    l2_2: Level2;
}

contract MultiDeep {
    state: Level1;

    init() {
        self.state = Level1{
            l2_1: Level2{ id: 1, info: Level3{ flag: true, comment: "a" } },
            l2_2: Level2{ id: 2, info: Level3{ flag: false, comment: "b" } },
        };
    }
}
