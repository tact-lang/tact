struct Level3 {
    x: Bool;
}

struct Level2 {
    inner3: Level3;
    y: String;
}

struct Level1 {
    inner2: Level2;
    z: Int;
}

contract DeepNestTest {
    nested: Level1;

    init() {
        self.nested = Level1{
            inner2: Level2{
                inner3: Level3{
                    x: true
                },
                y: "level2"
            },
            z: 42
        };
    }
}