struct DeeplyNestedOptional {
    inner: Int?;
}

struct LevelTwo {
    nested: DeeplyNestedOptional?;
}

struct LevelOne {
    levelTwo: LevelTwo?;
}

contract NestOptDepthContract {
    data: LevelOne;

    init() {
        self.data = LevelOne{
            levelTwo: null,
        };
    }

    receive() {}
}