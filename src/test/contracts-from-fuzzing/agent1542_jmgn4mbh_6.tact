struct Level3 {
    z: Int?;
    w: Bool?;
}

struct Level2 {
    inner: Level3;
    s: String?;
}

struct Level1 {
    l2: Level2;
    b: Bool;
}

contract Test {
    nested: Level1;

    init() {
        self.nested = Level1{
            l2: Level2{
                inner: Level3{ z: 7, w: false },
                s: "deep"
            },
            b: true
        };
    }
}