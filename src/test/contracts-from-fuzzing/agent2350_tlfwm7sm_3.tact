struct Level3 { f1: Int; f2: Bool?; f3: String?; }

struct Level2 { sub: Level3; x: Int; y: Bool; }

struct Level1 { sub: Level2; s: String; opt: Int?; }

contract MultiLevelDeep {
    data: Level1;

    init() {
        self.data = Level1{
            sub: Level2{
                sub: Level3{
                    f1: 99,
                    f2: null,
                    f3: null
                },
                x: 77,
                y: true
            },
            s: "hi",
            opt: null
        };
    }
}