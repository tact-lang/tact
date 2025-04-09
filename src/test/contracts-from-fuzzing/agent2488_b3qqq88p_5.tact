struct Level3 {
    leaf: Int;
}

struct Level2 {
    inner: Level3?;
}

struct Level1 {
    optInner: Level2?;
    z: Int;
}

contract DeepOpt {
    root: Level1;

    init() {
        self.root = Level1{
            optInner: null,
            z: 999
        };
    }
}