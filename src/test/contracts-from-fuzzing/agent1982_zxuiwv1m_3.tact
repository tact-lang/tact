struct DeeplyNested {
    level1: Int;
    level2: Nested;
}

struct Nested {
    x: Int;
    y: Int?;
}

contract DeepNestTest {
    val: DeeplyNested;

    init() {
        self.val = DeeplyNested{
            level1: 1,
            level2: Nested{ x: 2, y: 3 },
        };
    }
}