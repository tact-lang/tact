struct Nested {
    val1: Int;
    val2: Bool;
    val3: String?;
}

contract Test {
    data: Nested;

    init() {
        self.data = Nested{
            val1: 1,
            val2: true,
            val3: "hi",
        };
    }
}