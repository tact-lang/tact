struct Nested {
    inn: Int;
}

contract DeepTest {
    nested: Nested;

    init() {
        self.nested = Nested{ inn: 5 };
    }
}