struct Level2 {
    field: Int;
}

struct Level1 {
    inner: Level2;
}

struct TopLevel {
    nested: Level1;
}

contract ThreeLevelNestedStruct {
    field: TopLevel;
    init() {
        self.field = TopLevel{ nested: Level1{ inner: Level2{ field: 10 } } };
    }
}