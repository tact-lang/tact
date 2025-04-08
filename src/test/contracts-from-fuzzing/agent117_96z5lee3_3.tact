struct Level3 {
    z: Int;
}

struct Level2 {
    y: Level3;
    flag: Bool;
}

struct Level1 {
    x: Level2;
    text: String;
    opt: Int?;
}

contract DeepNest {
    storage: Level1;

    init() {
        self.storage = Level1{
            x: Level2{
                y: Level3{z: 5},
                flag: true
            },
            text: "nested",
            opt: null
        };
    }
}