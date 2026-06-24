struct Nested {
    value: Int;
}

contract DeeplyNestedFields {
    nested: Nested;
    innerNested: Nested;
    tripleNested: Nested;
    quadNested: Nested;
    deepNested: Nested;

    init() {
        self.nested = Nested{ value: 1 };
        self.innerNested = Nested{ value: 2 };
        self.tripleNested = Nested{ value: 3 };
        self.quadNested = Nested{ value: 4 };
        self.deepNested = Nested{ value: 5 };
    }
}