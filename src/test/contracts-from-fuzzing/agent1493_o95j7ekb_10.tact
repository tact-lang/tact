struct Level2 {
    d: Int;
    e: Int?;
}

struct Level1 {
    a: Int;
    b: Level2;
    c: Int?;
}

contract OptNested {
    data: Level1?;

    init() {
        self.data = null;
    }
}
