struct Nested {
    i: Int;
    b: Bool;
    s: String;
}

contract TestContract {
    data: Nested;

    init() {
        self.data = Nested{
            i: 42,
            b: true,
            s: "test",
        };
    }
}