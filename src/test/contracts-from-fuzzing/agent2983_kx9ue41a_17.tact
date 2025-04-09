struct Level3 {
    k: String;
}

struct Level2 {
    m: Level3;
    flag: Bool;
}

struct Level1 {
    l: Level2;
    x: Int;
}

contract OptionalInNestedStruct {
    f: Level1?;

    init() {
        self.f = null;
    }
}