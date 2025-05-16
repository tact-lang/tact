struct Level3 {
    a: Int;
}

struct Level2 {
    l3: Level3;
    b: Bool?;
}

struct Level1 {
    l2: Level2;
    s: String;
}

contract MultiLevelNested {
    x: Level1;
    init() {
        self.x = Level1{
            l2: Level2{
                l3: Level3{
                    a: 42
                },
                b: true
            },
            s: "deep"
        };
    }
}