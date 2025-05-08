struct Nested {
    a: Int as uint8 = 7;
    b: Bool?;
    c: String = "hi";
}

contract TestContract {
    value: Nested;

    init() {
        self.value = Nested{
            a: 5,
            b: null,
            c: "hello"
        };
    }
}