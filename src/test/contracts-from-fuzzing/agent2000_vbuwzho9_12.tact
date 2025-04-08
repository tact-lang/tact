struct Level3 {
    i: Int;
    s: String;
}

struct Level2 {
    nested: Level3;
    f: Bool;
}

struct Level1 {
    inner: Level2?;
    num: Int;
}

contract OptionalMidLayer {
    m: Level1;
    init() {
        self.m = Level1{ inner: null, num: 777 };
    }
}