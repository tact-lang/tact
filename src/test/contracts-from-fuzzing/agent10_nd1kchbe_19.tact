struct Level3 {
    z: Int;
}

struct Level2 {
    y: Level3;
    k: Bool;
}

struct Level1 {
    x: Level2;
    s: String;
}

contract MixedDeep {
    data: Level1;

    init() {
        self.data = Level1{
            x: Level2{
                y: Level3{ z: 123 },
                k: true
            },
            s: "hi"
        };
    }
}