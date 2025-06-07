struct Nested {
    val1: Int;
    val2: Int?;
}

contract TestContract {
    nestedField: Nested;

    init() {
        self.nestedField = Nested{
            val1: 42,
            val2: null,
        };
    }
}