struct Nested {
    inner1: Int;
    inner2: Int;
    inner3: Int;
}

contract ManyNested {
    one: Nested;
    two: Nested;

    init() {
        self.one = Nested{ inner1: 1, inner2: 2, inner3: 3 };
        self.two = Nested{ inner1: 4, inner2: 5, inner3: 6 };
    }
}