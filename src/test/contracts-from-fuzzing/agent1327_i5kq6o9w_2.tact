struct Deep {
    level1: Int;
    level2: Int?;
    nested: Nested;
}

struct Nested {
    innerFlag: Bool;
    innerText: String?;
}

contract Storage {
    storage: Deep;

    init() {
        self.storage = Deep{
            level1: 1,
            level2: null,
            nested: Nested{
                innerFlag: true,
                innerText: null
            }
        };
    }
}