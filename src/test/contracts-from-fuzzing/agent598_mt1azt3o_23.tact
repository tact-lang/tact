message(111) LeafMsg {
    a: Int?;
    b: Bool;
}

struct Level3 {
    msgOpt: LeafMsg?;
    value: Int as uint32;
    flag: Bool?;
}

struct Level2 {
    inner: Level3?;
    bigVal: Int as int64;
}

struct Level1 {
    nested: Level2;
    name: String;
}

contract DeepCrazy {
    data: Level1;

    init() {
        self.data = Level1{
            nested: Level2{
                inner: Level3{
                    msgOpt: LeafMsg{ a: 777, b: true },
                    value: 123456,
                    flag: null
                },
                bigVal: -987654321
            },
            name: "DeepNest"
        };
    }
}