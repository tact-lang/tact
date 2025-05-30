struct Level3 {
    x: Int;
    y: Bool;
}

struct Level2 {
    m: Int;
    nested3: Level3;
}

struct Level1 {
    s: String;
    nested2: Level2;
}

contract OptionalNestedStruct {
    nested: Level1?;

    init() {
        self.nested = null;
    }
}