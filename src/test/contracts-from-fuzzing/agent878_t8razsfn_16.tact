struct Level2 {
    x: Int? as uint8;
    y: String?;
}

struct Level1 {
    nested: Level2?;
    flag: Bool?;
}

contract Test {
    s: Level1?;

    init() {
        self.s = null;
    }
}