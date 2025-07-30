struct Level3 {
    z: Int;
}

struct Level2 {
    y: Bool;
    l3: Level3;
}

struct Level1 {
    x: String;
    l2: Level2;
}

contract DeepNest {
    data: Level1;

    init() {
        self.data = Level1{
            x: "abc",
            l2: Level2{
                y: true,
                l3: Level3{
                    z: 42
                }
            }
        };
    }
}
