struct Level2 {
    z: String?;
}

struct Level1 {
    x: Int;
    y: Level2;
}

contract DeepNested {
    nested: Level1;

    init() {
        self.nested = Level1{
            x: 3,
            y: Level2{ z: "deep" }
        };
    }
}
