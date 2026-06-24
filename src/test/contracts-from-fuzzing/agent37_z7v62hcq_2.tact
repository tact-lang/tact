struct Nested {
    a: Int;
    b: Bool;
    c: String;
}

contract Test {
    data: Nested;
    init() {
        self.data = Nested{
            a: 10,
            b: true,
            c: "ok",
        };
    }
}