struct DeeplyOptional {
    inner: LevelOne?;
}

struct LevelOne {
    l2: LevelTwo?;
    flag: Bool?;
}

struct LevelTwo {
    number: Int?;
    text: String?;
}

contract ExplicitOptionals {
    s: DeeplyOptional;

    init() {
        self.s = DeeplyOptional{
            inner: LevelOne{
                l2: LevelTwo{
                    number: 7,
                    text: null,
                },
                flag: true,
            },
        };
    }
}