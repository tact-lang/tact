struct Level3 {
    p: Int;
    q: String?;
}

struct Level2 {
    m: Bool;
    inner: Level3;
    x: Int?;
}

struct Level1 {
    flag: Bool;
    sub: Level2;
}

contract DeeplyNested {
    storage: Level1;

    init() {
        self.storage = Level1{
            flag: true,
            sub: Level2{
                m: false,
                inner: Level3{
                    p: 777,
                    q: "deep"
                },
                x: 42
            }
        };
    }
}