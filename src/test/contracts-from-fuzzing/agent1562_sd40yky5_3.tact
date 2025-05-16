struct Level3 {
    v1: Int;
    v2: Bool?;
}

struct Level2 {
    l3: Level3;
    text: String;
}

struct Level1 {
    l2: Level2;
    num: Int?;
}

contract DeepContract {
    data: Level1;
    init() {
        self.data = Level1{
            l2: Level2{
                l3: Level3{
                    v1: 100,
                    v2: null,
                },
                text: "deep",
            },
            num: null,
        };
    }
}