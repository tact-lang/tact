struct Level3 {
    z: Int?;
}

struct Level2 {
    y: Level3;
}

struct Level1 {
    x: Level2;
}

contract OptionalDeep {
    deep: Level1?;
    init() {
        self.deep = null;
    }
}