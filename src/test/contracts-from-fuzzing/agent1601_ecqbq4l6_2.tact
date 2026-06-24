struct Nested {
    val1: Int;
    val2: Bool?;
    s: String;
}

contract TestContract {
    nested: Nested;

    init() {
        self.nested = Nested{
            val1: 42,
            val2: true,
            s: "abc"
        };
    }
}