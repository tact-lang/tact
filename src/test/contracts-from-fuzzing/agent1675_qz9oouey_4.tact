struct Level3 {
    aa: Int;
    bb: Bool?;
}

struct Level2 {
    cc: Level3;
    dd: Level3?;
}

struct Level1 {
    ee: Level2;
    ff: Level2?;
}

struct Top {
    gg: Level1;
    hh: Level1?;
}

contract DeepStructFields {
    top: Top;
    init() {
        self.top = Top{
            gg: Level1{
                ee: Level2{
                    cc: Level3{ aa: 1, bb: null },
                    dd: null
                },
                ff: null
            },
            hh: null
        };
    }
}