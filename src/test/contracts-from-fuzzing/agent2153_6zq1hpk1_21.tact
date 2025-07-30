struct InnerMost2 {
    deepInt: Int;
}

struct LevelTwo {
    middle: InnerMost2;
    flag: Bool;
}

contract ManyDeepLevels {
    data: LevelTwo;

    init() {
        self.data = LevelTwo{ middle: InnerMost2{ deepInt: 999 }, flag: true };
    }
}
