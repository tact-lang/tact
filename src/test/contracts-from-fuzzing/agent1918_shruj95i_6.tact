struct Level2Opt {
    deepOpt: Int?;
}

struct Level1Opt {
    optStruct: Level2Opt?;
}

contract TestContract {
    data: Level1Opt;

    init() {
        self.data = Level1Opt{
            optStruct: Level2Opt{
                deepOpt: 123
            }
        };
    }
}