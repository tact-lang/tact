struct Level3Opt {
    foo: Int?;
}

struct Level2Opt {
    nested3: Level3Opt?;
}

struct Level1Opt {
    nested2: Level2Opt?;
}

contract DeepOptionalOptionalTest {
    data: Level1Opt;
    init() {
        self.data = Level1Opt{ nested2: Level2Opt{ nested3: Level3Opt{ foo: null } } };
    }
}
