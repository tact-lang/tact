struct Nested {
    value1: Int;
    value2: Int;
}

struct TopLevel {
    nested1: Nested;
    nested2: Nested;
    flag: Bool;
}

contract ManyNestedFields {
    top: TopLevel;

    init() {
        self.top = TopLevel {
            nested1: Nested { value1: 1, value2: 2 },
            nested2: Nested { value1: 3, value2: 4 },
            flag: true
        };
    }
}