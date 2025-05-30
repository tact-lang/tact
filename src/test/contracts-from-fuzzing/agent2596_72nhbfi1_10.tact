struct Nested {
    x: Int;
    y: Bool;
}

contract ManyNested {
    n1: Nested;
    n2: Nested;
    n3: Nested;

    init() {
        self.n1 = Nested{ x: 1, y: true };
        self.n2 = Nested{ x: 2, y: false };
        self.n3 = Nested{ x: 3, y: true };
    }
}