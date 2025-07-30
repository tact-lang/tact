struct Nested {
    flag: Bool;
    num: Int;
}

contract DeepNestTest {
    nestedField: Nested;

    init() {
        self.nestedField = Nested{ flag: true, num: 123 };
    }
}