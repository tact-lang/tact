struct Nested1 { field1: Int; field2: Bool; }

contract TestContract {
    nestedField: Nested1;

    init() {
        self.nestedField = Nested1{ field1: 1, field2: true };
    }
}