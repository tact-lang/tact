struct Nested { nestedVal: Int }

contract TestContract {
    nested: Nested;

    init() {
        self.nested = Nested{ nestedVal: 42 };
    }
}