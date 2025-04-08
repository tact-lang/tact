struct MixDeep {
    depth1: Level1;
    flag: Bool;
}

struct Level1 {
    depth2: Level2;
    text: String?;
}

struct Level2 {
    number: Int;
    optDeep: Level3?;
}

struct Level3 {
    info: String?;
}

contract TestContract {
    m: MixDeep;
    init() {
        self.m = MixDeep{
            depth1: Level1{
                depth2: Level2{
                    number:42,
                    optDeep:null
                },
                text: "hi"
            },
            flag:true
        };
    }
}