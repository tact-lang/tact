struct Level3Opt {
    value: Int?;
}

struct Level2Opt {
    l3: Level3Opt;
}

struct Level1Opt {
    l2: Level2Opt;
}

contract DeepNullable {
    top: Level1Opt;

    init() {
        self.top = Level1Opt{
            l2: Level2Opt{
                l3: Level3Opt{
                    value: null
                }
            }
        };
    }
}