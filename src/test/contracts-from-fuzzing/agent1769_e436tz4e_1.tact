struct Nested {
    val1: Int;
    val2: Bool;
    val3: String;
}

contract DeepStorage {
    nestedField: Nested;
    init() {
        self.nestedField = Nested{
            val1: 1,
            val2: true,
            val3: "a",
        };
    }
}