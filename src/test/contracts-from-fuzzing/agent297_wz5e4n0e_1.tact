struct Nested {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
}

contract TestContract {
    data: Nested;

    init() {
        self.data = Nested{
            a: 1,
            b: true,
            c: "test",
            d: 42,
        };
    }
}