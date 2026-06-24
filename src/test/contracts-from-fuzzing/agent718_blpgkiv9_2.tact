struct LevelThree {
    value: Int;
}

struct LevelTwo {
    levelThree: LevelThree;
}

struct LevelOne {
    optionalLevelTwo: LevelTwo?;
}

contract NestedOptionalStructTest {
    data: LevelOne;
    init() {
        self.data = LevelOne{ optionalLevelTwo: null };
    }
}