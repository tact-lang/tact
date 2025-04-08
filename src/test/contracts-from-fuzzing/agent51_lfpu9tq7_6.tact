struct LevelThree {
    flag: Bool;
    note: String?;
}

struct LevelTwo {
    num: Int;
    inner: LevelThree;
}

struct LevelOne {
    label: String;
    next: LevelTwo;
}

contract MultiLevelOptionals {
    nested: LevelOne;

    init() {
        self.nested = LevelOne{
            label: "top",
            next: LevelTwo{
                num: 7,
                inner: LevelThree{
                    flag: false,
                    note: null,
                },
            },
        };
    }
}
