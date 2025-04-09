struct Nested {
    val: Int;
    flag: Bool;
    text: String;
}

contract Test {
    info: Nested;
    init() {
        self.info = Nested{
            val: 123,
            flag: true,
            text: "testing",
        };
    }
}