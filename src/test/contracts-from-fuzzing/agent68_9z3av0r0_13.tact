struct Level3 {
    a: Int;
    b: Bool?;
}

struct Level2 {
    nested: Level3?;
}

struct Level1 {
    nested: Level2?;
}

contract TripleOptionalDepth {
    storage: Level1;

    init() {
        self.storage = Level1{
            nested: Level2{
                nested: null
            }
        };
    }
}