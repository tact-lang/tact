struct Nested {
    value: Int = 1 + 2 * 3;
    flag: Bool = true;
}

contract MathDefaults {
    n: Nested;

    init() {
        self.n = Nested{};
    }
}