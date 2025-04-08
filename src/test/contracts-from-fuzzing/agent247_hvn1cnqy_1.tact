struct Nested {
    level1: Int;
    level2: Int;
}

struct Deep {
    nested: Nested;
    optionalNested: Nested?;
}

contract DeepStructTest {
    data: Deep;

    init() {
        self.data = Deep{
            nested: Nested{level1: 1, level2: 2},
            optionalNested: null,
        };
    }
}