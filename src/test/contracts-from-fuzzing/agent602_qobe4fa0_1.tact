struct Nested {
    a: Int;
    b: Bool;
    c: String?;
}

contract TestContract {
    data: Nested;

    init() {
        self.data = Nested{
            a: 1,
            b: true,
            c: "hello",
        };
    }
}