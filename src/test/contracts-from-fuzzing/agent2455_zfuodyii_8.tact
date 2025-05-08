struct Level2 {
    a: Int;
}

struct Level1 {
    nested: Level2;
}

contract TopOptionalNested {
    optionalNested: Level1?;

    init() {
        self.optionalNested = null;
    }
}