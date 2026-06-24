struct Level2 {
    z: Bool;
}

struct Level1 {
    x: Int?;
    y: Level2?;
}

contract OptionalNestedStorage {
    rec: Level1?;

    init() {
        self.rec = Level1{
            x: null,
            y: Level2{z: true}
        };
    }
}
