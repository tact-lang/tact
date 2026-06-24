struct Nested {
    nested_val: Int;
}

contract DeepStorage {
    data: Nested;

    init() {
        self.data = Nested{ nested_val: 42 };
    }
}