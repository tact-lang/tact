struct LevelTwo {
    count: Int;
    name: String;
}

struct LevelOne {
    nested: LevelTwo;
    desc: String;
}

contract TwoLevels {
    data: LevelOne;
    opt: Bool?;

    init() {
        self.data = LevelOne {
            nested: LevelTwo { count: 33, name: "hi" },
            desc: "desc"
        };
        self.opt = true;
    }
}