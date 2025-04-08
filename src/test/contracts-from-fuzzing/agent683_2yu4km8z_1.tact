struct Nested {
    val1: Int;
    val2: Bool;
    val3: String;
    val4: Address;
    val5: Int?;
}

contract TestContract {
    nested: Nested;

    init() {
        self.nested = Nested{
            val1: 1,
            val2: true,
            val3: "test",
            val4: myAddress(),
            val5: null
        };
    }
}