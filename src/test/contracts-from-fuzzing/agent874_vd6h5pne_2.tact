struct Nested {
    a: Int;
    b: String;
    c: Bool?;
}

contract TestContract {
    record: Nested;

    init() {
        self.record = Nested{
            a: 5,
            b: "hello",
            c: true,
        };
    }
}
