struct TripleNested {
    val: Int;
}

struct Mid {
    nested: TripleNested;
}

struct Top {
    nested: Mid;
}

contract Nested3Levels {
    storage: Top;

    init() {
        self.storage = Top{
            nested: Mid{
                nested: TripleNested{
                    val:123
                }
            }
        };
    }
}