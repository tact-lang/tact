struct Level3 {
    deepVal: Int?;
    flag: Bool?;
    text: String?;
}

struct Level2 {
    nested: Level3?;
    count: Int;
}

struct Level1 {
    sub: Level2?;
    msg: String;
}

contract OptionalCascade {
    data: Level1;

    init() {
        self.data = Level1{
            sub: Level2{
                nested: Level3{
                    deepVal: null,
                    flag: null,
                    text: null
                },
                count: 99
            },
            msg: "opt"
        };
    }
}
