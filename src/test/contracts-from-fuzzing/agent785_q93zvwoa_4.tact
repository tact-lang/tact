struct Level3 {
    a: Int;
    b: Bool;
}

struct Level2 {
    x: String;
    y: Level3;
}

struct Level1 {
    mid: Level2;
    flag: Bool;
}

contract OptDeep {
    field: Level1?;

    init() {
        self.field = null;
    }
}