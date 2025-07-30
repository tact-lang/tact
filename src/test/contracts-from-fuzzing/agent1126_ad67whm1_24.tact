struct Level1Opt {
    a: Int?;
}

struct Level2Opt {
    b: Level1Opt?;
}

contract OptInOptStruct {
    nested: Level2Opt;

    init() {
        self.nested = Level2Opt{
            b: Level1Opt{ a: null }
        };
    }
}