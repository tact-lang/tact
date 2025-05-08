struct Nested {
    val1: Int;
    val2: Int?;
}

contract TestContract {
    data: Nested;

    init() {
        self.data = Nested{
            val1: 42,
            val2: null,
        };
    }
}