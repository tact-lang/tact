struct DeepOpt {
    a: Int?;
    nested: Level2Opt;
}

struct Level2Opt {
    b: String?;
    inner: Level3Opt;
}

struct Level3Opt {
    c: Bool?;
}

contract DeepOptionalTest {
    storage: DeepOpt;

    init() {
        self.storage = DeepOpt{
            a: null,
            nested: Level2Opt{
                b: null,
                inner: Level3Opt{ c: null }
            }
        };
    }
}