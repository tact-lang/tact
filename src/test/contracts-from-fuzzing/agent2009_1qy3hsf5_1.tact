struct Nested {
    inner1: Int;
    inner2: Bool;
}

contract TestDeepNestedFields {
    level1: Nested;
    level2: Nested;
    level3: Nested;
    level4: Nested;
    level5: Nested;
    init() {
        self.level1 = Nested{inner1: 1, inner2: true};
        self.level2 = Nested{inner1: 2, inner2: false};
        self.level3 = Nested{inner1: 3, inner2: true};
        self.level4 = Nested{inner1: 4, inner2: false};
        self.level5 = Nested{inner1: 5, inner2: true};
    }
}