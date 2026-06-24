struct Nested { val1: Int; val2: Int?; }

contract DeepNestedContract {
    nested: Nested;

    init() {
        self.nested = Nested{ val1: 1, val2: null };
    }
}