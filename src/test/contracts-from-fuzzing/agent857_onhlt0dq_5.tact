struct Level3 {
    z: String;
}

struct Level2 {
    y: Int?;
    l3: Level3;
}

struct Level1 {
    x: Bool;
    l2: Level2;
}

contract Test {
    nested: Level1;

    init() {
        self.nested = Level1{
            x: false,
            l2: Level2{
                y: null,
                l3: Level3{ z: "hello" }
            }
        };
    }
}