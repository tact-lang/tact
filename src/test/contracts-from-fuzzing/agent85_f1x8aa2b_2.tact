struct Nested {
    val1: Int;
    val2: Bool;
    val3: String;
}

contract StructInState {
    n: Nested;

    init() {
        self.n = Nested{
            val1: 1,
            val2: true,
            val3: "hi",
        };
    }

    receive() {}
}