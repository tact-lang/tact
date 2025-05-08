struct Level2 {
    flag: Bool;
}

struct Level1 {
    id: Int;
    sub: Level2?;
}

contract OptionalNested {
    nested: Level1?;

    init() {
        self.nested = Level1{
            id: 11,
            sub: null,
        };
    }
}