contract DeepNestedOptionalInit {
    optVal: DeepNested?;

    init() {
        self.optVal = null;
    }
}

struct DeepNested {
    a: Int;
    nested: Level1;
}

struct Level1 {
    inner: Level2;
    b: Bool;
}

struct Level2 {
    s: String;
    c: Int?;
}