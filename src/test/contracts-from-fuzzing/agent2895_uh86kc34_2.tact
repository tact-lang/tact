struct DeepNested {
    val: Int;
}

struct Level2 {
    nested: DeepNested;
    flag: Bool;
}

struct Level1 {
    nested: Level2;
    optStr: String?;
}

contract DeepNestedStructContract {
    s: Level1;

    init() {
        self.s = Level1{
            nested: Level2{ nested: DeepNested{ val: 42 }, flag: true },
            optStr: null
        };
    }
}
