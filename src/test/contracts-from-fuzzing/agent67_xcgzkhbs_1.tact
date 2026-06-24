struct Nested {
    val1: Int;
    val2: Bool?;
    val3: String;
}

contract TestStorage {
    nestedField: Nested;

    init() {
        self.nestedField = Nested{
            val1: 42,
            val2: true,
            val3: "hello"
        };
    }
}