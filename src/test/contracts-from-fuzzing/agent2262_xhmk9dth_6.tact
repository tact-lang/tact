struct Level3 {
    x: String?;
    y: Bool;
}

struct Level2 {
    m: Int;
    n: Level3;
}

struct Level1 {
    a: Bool?;
    b: Level2;
}

contract Test {
    nested: Level1;

    init() {
        self.nested = Level1{
            a: null,
            b: Level2{
                m: 5,
                n: Level3{
                    x: null,
                    y: true
                }
            }
        };
    }
}