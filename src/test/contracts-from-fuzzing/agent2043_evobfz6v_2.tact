struct LevelThree {
    x: Int;
    y: Bool;
}

struct LevelTwo {
    nested: LevelThree;
    optionalNested: LevelThree?;
}

struct LevelOne {
    inner: LevelTwo;
    optionalInner: LevelTwo?;
}

contract DeeplyNested {
    data: LevelOne;

    init() {
        self.data = LevelOne{
            inner: LevelTwo{
                nested: LevelThree{x: 1, y: true},
                optionalNested: null
            },
            optionalInner: null
        };
    }
}
