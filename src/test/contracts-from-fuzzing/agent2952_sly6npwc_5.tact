struct Level2 {
    optInt: Int?;
    flag: Bool;
}

struct Level1 {
    nested: Level2?;
}

contract OptionalNestedStructField {
    content: Level1;

    init() {
        self.content = Level1{ nested: null };
    }
}