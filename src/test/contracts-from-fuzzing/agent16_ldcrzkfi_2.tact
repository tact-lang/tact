struct Level3 {
    x: Int;
}

struct Level2 {
    l3: Level3;
    y: Int?;
}

struct Level1 {
    l2: Level2;
    z: String;
}

contract DeepNested {
    data: Level1;

    init() {
        self.data = Level1{
            l2: Level2{
                l3: Level3{ x: 123 },
                y: null
            },
            z: "deep"
        };
    }
}