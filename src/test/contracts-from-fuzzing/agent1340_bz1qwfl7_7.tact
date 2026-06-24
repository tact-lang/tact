struct Inline1 { foo: Int; bar: Bool; }
struct Inline2 { nestedA: String; nestedB: Int?; }

struct BigNested {
    level1: Int;
    level2: Inline1;
    level3: Inline2;
}

contract NestedRefStructs {
    data: BigNested;

    init() {
        self.data = BigNested{
            level1: 1,
            level2: Inline1{ foo: 42, bar: true },
            level3: Inline2{ nestedA: "hi", nestedB: null },
        };
    }
}