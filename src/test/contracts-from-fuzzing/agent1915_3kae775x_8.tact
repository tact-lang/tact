struct Level2Opt {
    inner: Int?;
}

struct Level1Opt {
    nested: Level2Opt?;
}

contract NestedOptionalsStorage {
    f: Level1Opt;

    init() {
        self.f = Level1Opt{ nested: null };
    }
}