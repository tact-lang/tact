struct Nested {
    a: Int;
    b: Bool;
    c: String;
}

contract TestDeep {
    data: Nested;

    init() {
        self.data = Nested{
            a: 42,
            b: true,
            c: "test"
        };
    }
}