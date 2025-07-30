struct Nested {
    val1: Int;
    val2: Bool;
}

contract TestContract {
    nestedField: Nested;

    init() {
        self.nestedField = Nested{
            val1: 123,
            val2: true
        };
    }
}