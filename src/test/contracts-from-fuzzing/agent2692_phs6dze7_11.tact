struct DeeplyOptional {
    a: Int?;
    b: LevelTwo?;
}

struct LevelTwo {
    x: Int;
    y: LevelThree?;
}

struct LevelThree {
    p: String?;
    q: Int?;
}

contract ChainOptional {
    d: DeeplyOptional?;

    init() {
        self.d = null;
    }
}
