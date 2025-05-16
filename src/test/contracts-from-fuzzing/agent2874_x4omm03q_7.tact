struct LevelTwo {
    a: Int?;
    b: Bool;
}

struct LevelOne {
    nested: LevelTwo?;
    s: String;
}

contract TestContract {
    deepOpt: LevelOne;

    init() {
        self.deepOpt = LevelOne{
            nested: LevelTwo{a: 10, b: true},
            s: "done"
        };
    }
}
