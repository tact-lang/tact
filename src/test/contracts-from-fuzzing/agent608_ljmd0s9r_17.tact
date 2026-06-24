struct LevelOne {
    a: Int?;
}

struct LevelTwo {
    one: LevelOne?;
}

struct LevelThree {
    two: LevelTwo?;
}

contract ChainOptionalFields {
    val: LevelThree?;

    init() {
        self.val = null;
    }
}
