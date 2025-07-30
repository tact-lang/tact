struct Level3Opt {
    x: Int?;
}

struct Level2Opt {
    y: Level3Opt?;
}

struct Level1Opt {
    z: Level2Opt?;
}

contract MultiOptionalNested {
    field: Level1Opt;

    init() {
        self.field = Level1Opt{
            z: null
        };
    }
}