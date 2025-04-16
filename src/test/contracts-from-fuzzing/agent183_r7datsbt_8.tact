// Test nullable struct field persistence
struct OptionalStructField {
    x: Int;
}

contract StructFieldOptional {
    value: OptionalStructField? = null;

    init() {
        self.value = OptionalStructField{ x: 42 };
    }
}