struct Level3Option {
    f: Int?;
}

struct Level2Option {
    l3: Level3Option?;
}

contract MultiLevelOptStruct {
    info: Level2Option;

    init() {
        self.info = Level2Option{
            l3: null
        };
    }
}