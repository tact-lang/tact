struct Level1 {
    x: Int?;
}

struct Level2 {
    inner: Level1?;
    more: Int;
}

struct Level3 {
    inner: Level2?;
    flag: Bool;
}

contract OptionalDeep {
    opt: Level3?;

    init() {
        self.opt = null;
    }
}