struct LevelA {
    b: LevelB;
    optA: Int?;
}

struct LevelB {
    c: LevelC?;
    reqB: Bool;
}

struct LevelC {
    s: String;
    optC: Bool?;
}

contract MixedDeepNesting {
    data: LevelA;

    init() {
        self.data = LevelA{
            b: LevelB{
                c: LevelC{
                    s: "hi",
                    optC: null
                },
                reqB: true
            },
            optA: null
        };
    }
}
