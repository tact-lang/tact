struct Level2 {
    x: Int;
    y: Bool?;
}

struct Level1 {
    nested: Level2?;
    comment: String;
}

contract OptNested {
    data: Level1?;

    init() {
        self.data = null;
    }
}
