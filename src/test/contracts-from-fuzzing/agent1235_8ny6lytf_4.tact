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

contract DeepNested {
    content: Level1;

    init() {
        self.content = Level1{
            x: "deep",
            l2: Level2{
                y: false,
                l3: Level3{
                    z: 123
                }
            }
        };
    }
}