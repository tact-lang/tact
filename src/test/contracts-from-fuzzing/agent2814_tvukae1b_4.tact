struct Pair {
    a: Int;
    b: Int;
}

struct MultiNested {
    one: Pair;
    two: Pair;
    three: Pair;
}

contract MultiNestedTest {
    storage: MultiNested;

    init() {
        self.storage = MultiNested{
            one: Pair{ a: 1, b: 2 },
            two: Pair{ a: 3, b: 4 },
            three: Pair{ a: 5, b: 6 }
        };
    }
}