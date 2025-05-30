struct Nested { value: Int = 42; }

contract TestContract {
    nestedField: Nested;

    init() {
        self.nestedField = Nested{};
    }

    receive() {
        dump(self.nestedField.value);
    }
}